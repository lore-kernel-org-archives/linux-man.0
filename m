From: Vincent Lefevre <vincent-buymaDBGzMOsTnJN9+BGXg@public.gmane.org>
Subject: clock(3) man page: precision vs accuracy
Date: Fri, 12 Sep 2014 14:08:04 +0200
Message-ID: <20140912120804.GE4404@xvii.vinc17.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

http://man7.org/linux/man-pages/man3/clock.3.html contains:

       In glibc 2.17 and earlier, clock() was implemented on top of
       times(2).  For improved precision, since glibc 2.18, it is
                      ^^^^^^^^^^^^^^^^^^
       implemented on top of clock_gettime(2) (using the
       CLOCK_PROCESS_CPUTIME_ID clock).

This looks strange. The user doesn't seek improved precision, but
improved accuracy: if one gets more digits but the value itself is
less accurate (i.e. the error against the ideal value is larger),
this is bad. Perhaps changing "precision" to "accuracy" would be
correct (I assume that the real goal of the change was not just
improved precision, but more importantly the resulting improved
accuracy). I've reported a bug about the glibc documentation:

  https://sourceware.org/bugzilla/show_bug.cgi?id=3D17383

--=20
Vincent Lef=E8vre <vincent-buymaDBGzMOsTnJN9+BGXg@public.gmane.org> - Web: <https://www.vinc17.net/>
100% accessible validated (X)HTML - Blog: <https://www.vinc17.net/blog/=
>
Work: CR INRIA - computer arithmetic / AriC project (LIP, ENS-Lyon)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
