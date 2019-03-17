package pl.coderslab.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.coderslab.model.TimeSlot;
import pl.coderslab.repository.TimeSlotRepository;

public class TimeSlotConverter implements Converter<String, TimeSlot> {

    @Autowired
    private TimeSlotRepository timeSlotRepository;

    @Override
    public TimeSlot convert(String s) {
        return timeSlotRepository.findOne(Integer.parseInt(s));
    }
}