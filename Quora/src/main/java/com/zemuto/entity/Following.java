package com.zemuto.entity;

import org.springframework.context.annotation.Scope;

import javax.persistence.*;

@Entity
@Scope("session")
public class Following {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @ManyToOne
    @JoinColumn(name = "followerID", referencedColumnName = "id")
    private User follower;
    @ManyToOne
    @JoinColumn(name = "followedID", referencedColumnName = "id")
    private User followed;

    public Following() {
    }

    public User getFollower() {
        return follower;
    }

    public void setFollower(User follower) {
        this.follower = follower;
    }

    public User getFollowed() {
        return followed;
    }

    public void setFollowed(User followed) {
        this.followed = followed;
    }

    @Override
    public String toString() {
        return "Following{" +
                "id=" + id +
                ", follower=" + follower +
                ", followed=" + followed +
                '}';
    }
}
