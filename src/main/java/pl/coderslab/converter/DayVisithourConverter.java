package pl.coderslab.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.coderslab.model.DayVisithour;
import pl.coderslab.repository.DayVisithourRepository;

public class DayVisithourConverter implements Converter<String, DayVisithour> {

    @Autowired
    private DayVisithourRepository dayVisithourRepository;

    @Override
    public DayVisithour convert(String s) {
        return dayVisithourRepository.findOne(Integer.parseInt(s));
    }
}