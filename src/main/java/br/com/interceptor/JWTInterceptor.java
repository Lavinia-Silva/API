package br.com.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.auth0.jwt.JWTVerifier;

import br.com.restcontroller.LoginRestController;

public class JWTInterceptor extends HandlerInterceptorAdapter {

	private boolean adminLogado = false;

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HandlerMethod methodInfo;

		System.out.println();
		if (handler instanceof HandlerMethod) {
			methodInfo = (HandlerMethod) handler;
		} else {
			return true;
		}
		System.out.println("Método chamado ==>" + methodInfo.getMethod().getName());
		System.out.println("Controller chamado ==>" + methodInfo.getBean().getClass().getSimpleName());

		if (adminLogado || methodInfo.getBean().getClass().getSimpleName().equals("LinksController")) {
			return true;
		} else if (methodInfo.getMethod().getName().equals("logarFuncionario")
				|| methodInfo.getMethod().getName().equals("buscarSalao")) {
			return true;
		} else {
			String token = null;
			try {
				token = request.getHeader("Authorization");
				JWTVerifier verifier = new JWTVerifier(LoginRestController.SECRET);
				Map<String, Object> claims = verifier.verify(token);
				return true;
			} catch (Exception e) {
				e.printStackTrace();
				if (token == null) {
					response.sendError(HttpStatus.UNAUTHORIZED.value());
				} else {
					response.sendError(HttpStatus.FORBIDDEN.value());
				}
				return false;

			}
		}

	}
}
