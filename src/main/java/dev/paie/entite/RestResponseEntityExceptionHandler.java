package dev.paie.entite;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

//@ControllerAdvice désigne un greffon appliqué aux controlleurs
@ControllerAdvice
public class RestResponseEntityExceptionHandler extends ResponseEntityExceptionHandler {

// la méthode handleConflict est exécutée lorsqu'un contrôleur émet une exception présente
// dans la liste définie par l'annotation @ExceptionHandler
@ExceptionHandler(value = { IllegalArgumentException.class, IllegalStateException.class })
protected ResponseEntity<Object> handleConflict(RuntimeException ex, WebRequest request) {
   String bodyOfResponse = "This should be application specific";
   return handleExceptionInternal(ex, bodyOfResponse,
     new HttpHeaders(), HttpStatus.NOT_FOUND, request);
}
}
