package org.salgar.fsm.pekko.foureyes.usecasekey;

import java.util.Map;

import org.salgar.fsm.pekko.api.UseCaseKeyStrategy;
import org.springframework.stereotype.Component;

@Component
public class CreditUseCaseKeyStrategy implements UseCaseKeyStrategy {
    public static final String CREDIT_UUID = "creditUuid";
    @Override
    public String getKey(Map<String, Object> payload) {
        return (String) payload.get(CREDIT_UUID);
    }
}