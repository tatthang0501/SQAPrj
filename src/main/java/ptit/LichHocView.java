package ptit;

import java.io.Serializable;

import lombok.Data;

@Data
public class LichHocView implements Serializable{
    /**
     *
     */
    private static final long serialVersionUID = 1L;
    private int id;
    private String ten;
    private int soTC;
    private String tuanhoc;
    private String ngayhoc;
    private String kiphoc;
}
