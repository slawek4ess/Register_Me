package pl.coderslab.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.coderslab.model.Weekday;
import pl.coderslab.repository.WeekdayRepository;

public class WeekdayConverter implements Converter<String, Weekday> {

    @Autowired
    private WeekdayRepository weekdayRepository;

    @Override
    public Weekday convert(String s) {
        return weekdayRepository.findOne(Long.parseLong(s));
    }
}
