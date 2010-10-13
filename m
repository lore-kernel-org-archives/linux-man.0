From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 20082] Please document IP_FREEBIND
Date: Wed, 13 Oct 2010 04:33:09 GMT
Message-ID: <201010130433.o9D4X9iX008705@demeter2.kernel.org>
References: <bug-20082-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-20082-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=20082





--- Comment #2 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2010-10-13 04:33:08 ---
(In reply to comment #0)
> IP_FREEBIND is one of my favourite sockopts ;-) , as it allows race-free
> listening on any socket without requiring the network interface to be up. Would
> be cool to document this in inet(7).


How does the following look? 

+.TP
+.BR IP_FREEBIND " (since Linux 2.4)"
+.\" Precisely: 2.4.0-test10
+If enabled, this boolean option allows binding to an IP address
+that is nonlocal or does not (yet) exist.
+This permits listening on a socket,
+without requiring the underlying network interface or the
+specified dynamic IP address to be up at the time that
+the application is trying to bind to it.
+This option is the per-socket equivalent of the
+.IR ip_nonlocal_bind
+.I /proc
+interface described below.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
