package vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Json {
    private int id;
    private String name;
    private String username;
    private String email;
    private String address;
}
