package struts;

import java.io.IOException;
import java.util.Date;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import Bean.OmikujiBean;
import Bean.ResultsBean;
import DAO.OmikujiDao;
import DAO.ResultsDao;
import List.CSVReader;

public final class BirthdayAction extends Action {//Actionクラスをスーパークラスに指定して、AuthenticatonActionクラスを宣言する。
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {

		HttpSession session = request.getSession(); //getSessionメソッドを使用し、HttpSessionオブジェクトを取得。

		//アクション・フォームBeanから値の取り出し
		OmikujiResultsForm OmikujiResultsForm = (OmikujiResultsForm) form;
		String birthday = OmikujiResultsForm.getBirthday();
		session.setAttribute("birthday", birthday);//画面遷移を何回しても半永久敵に値が保存できる

			/**今日の日付を取得する */
			Date date = new Date();
			java.sql.Date resultsDate = convert(date);

			/** resultsテーブルから「誕生日」と「本日の日付」を条件にomikujiIdを取得する。
			 * １、データあり：取得したomikujiIdで出力
			 * ２、データなし：これからおみくじを生成し、そのomikujiIdで出力
			 *
			 * @return resultsBean
			 */
			ResultsBean rb = ResultsDao.selectByBirthday(resultsDate, birthday);

			String omikujiId = rb.getOmikujiId();
			ServletContext sc = this.getServlet().getServletContext();
			String path =sc.getRealPath("/WEB-INF/fortuneTelling.csv");

			/**新しくおみくじを生成してomikujiIdを取得する処理。*/
			if (omikujiId == null) {
				/**omikujiテーブルにデータが入っているかをチェックする処理。*/
				// もしomikujiテーブルにデータがなければ、csvファイルを読み込んでomikujiテーブルのデータを書き込む処理。
				int omikujiCnt = OmikujiDao.count();
				if (omikujiCnt == 0) {
					try {
						CSVReader.readCsv(path);
					} catch (IOException e) {
						// TODO 自動生成された catch ブロック
						e.printStackTrace();
					}
				omikujiCnt = OmikujiDao.count();
				}
				/**Randomでomikuji_idを取得する処理。（omikuji_idの全IDをシャッフルする） */
				Random random = new Random();
				// DBの接続して、randomの引数をSQLのCountを使用して取得する
				int randomValue = random.nextInt(omikujiCnt) + 1; // メソッドが０からカウントされるため、メソッド（）＋１をする
				omikujiId = Integer.toString(randomValue);
				/** 新しく生成したおみくじ(results_date・omikuji_id・birthday)DBに登録する処理。*/
				ResultsDao.insertResults(resultsDate, omikujiId, birthday);
			}

			/**omikuji_idを条件にomikujiテーブルから占い結果を取得する処理。*/
			OmikujiBean oi = OmikujiDao.selectByOmikuji(omikujiId);

			oi.getFortuneName();
			oi.getWish();
			oi.getBusiness();
			oi.getStudy();

			session.setAttribute("results", oi);
			return (mapping.findForward("success"));
		}

	/**
	 * メソッドの説明：
	 * utilクラスのDate型からsqlクラスのDate型に変換するメソッド
	 * （SQLで取得した本日の日付を使用するために、SQL使用できる型に変換する）
	 *
	 * @param java.util.Date utilDate
	 * @return resultDate
	 */
	private static java.sql.Date convert(java.util.Date utilDate) {
		java.sql.Date resultDate = new java.sql.Date(utilDate.getTime());
		return resultDate;
	}
}
