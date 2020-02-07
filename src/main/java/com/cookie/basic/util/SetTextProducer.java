package com.cookie.basic.util;

import nl.captcha.text.producer.TextProducer;

public class SetTextProducer implements TextProducer {
	//전달받은 문자열을 그대로 AudioCaptcha가 사용할 수 있도록  TextProducer 인터페이스를 상속받는 클래스
	
	private final String str;
	
	public SetTextProducer(String answer) {
		this.str = answer;
	}
	
	@Override
	public String getText() {
		return this.str;
	}
}
