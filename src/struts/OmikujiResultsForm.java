package struts;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

//Validatorを使用する場合はValidatorFormクラスを継承する。
//その他は一般的なアクション･フォームBeanの作成方法と変わらない。
public final class OmikujiResultsForm extends ActionForm {

	private String birthday;
	private String fortuneName;
	private String wish;
	private String business;
	private String study;

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

		 public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {

	ActionErrors errors = new ActionErrors();

	if (birthday.length() != 8) {
		errors.add("birthday",new ActionMessage("errors.length"));//エラー生成
	}
	SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
	format.setLenient(false);
	try {
		format.parse(birthday);
	} catch (Exception e) {
		errors.add("birthday",new ActionMessage("errors.date"));//エラー生成
	}
	return errors;
	}

	public String getFortuneName() {
		return fortuneName;
	}

	public void setFortuneName(String fortuneName) {
		this.fortuneName = fortuneName;
	}

	public String getWish() {
		return wish;
	}

	public void setWish(String wish) {
		this.wish = wish;
	}

	public String getBusiness() {
		return business;
	}

	public void setBusiness(String business) {
		this.business = business;
	}

	public String getStudy() {
		return study;
	}

	public void setStudy(String study) {
		this.study = study;
	}

	@Override
	public String toString() {
		return "OmikujiResultsForm [birthday=" + birthday + ", fortuneName=" + fortuneName + ", wish=" + wish
				+ ", business=" + business + ", study=" + study + "]";
	}

}
