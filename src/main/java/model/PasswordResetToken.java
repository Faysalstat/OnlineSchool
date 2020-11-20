
package model;

        import java.util.Date;
        import javax.persistence.Column;
        import javax.persistence.Entity;
        import javax.persistence.FetchType;
        import javax.persistence.GeneratedValue;
        import static javax.persistence.GenerationType.IDENTITY;
        import javax.persistence.Id;
        import javax.persistence.JoinColumn;
        import javax.persistence.ManyToOne;
        import javax.persistence.Table;
        import javax.persistence.Temporal;
        import javax.persistence.TemporalType;

/**
 *
 * @author Faysal
 */
@Entity
@Table(name = "password_reset_token",
        catalog = "onlineschooldb"
)
public class PasswordResetToken implements java.io.Serializable {

    private Integer id;
    private Date expiryDate;
    private String token;
    private User user;

    public PasswordResetToken() {
    }
    public PasswordResetToken(Date expiryDate, String token, User user) {
        this.expiryDate = expiryDate;
        this.token = token;
        this.user = user;
    }

    @Id @GeneratedValue(strategy=IDENTITY)


    @Column(name="id", unique=true, nullable=false)
    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Temporal(TemporalType.DATE)
    @Column(name = "expiryDate", length = 10)
    public Date getExpiryDate() {
        return this.expiryDate;
    }

    public void setExpiryDate(Date expiryDate) {
        this.expiryDate = expiryDate;
    }

    @Column(name = "token")
    public String getToken() {
        return this.token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    public User getUser() {
        return this.user;
    }

    public void setUser(User user) {
        this.user = user;
    }

}
