From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 13510] resolv.conf.5 implies that only IPv4 addresses are
 allowed
Date: Tue, 10 Sep 2013 16:31:31 +0000
Message-ID: <bug-13510-11311-TA39hoKY2V@https.bugzilla.kernel.org/>
References: <bug-13510-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-13510-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D13510

Jorge Ner=C3=ADn <jnerin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
-----------------------------------------------------------------------=
-----
                 CC|                            |jnerin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--- Comment #1 from Jorge Ner=C3=ADn <jnerin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
As of man-pages-3.51 resolv.conf.5:

       nameserver Name server IP address
              Internet address of a  name  server  that  the  resolver =
 should
              query,  either  an  IPv4  address  (in dot notation), or =
an IPv6
              address in colon (and possibly dot) notation as  per  RFC=
  2373.

So this bug can be closed.

--=20
You are receiving this mail because:
You are watching the assignee of the bug.--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
