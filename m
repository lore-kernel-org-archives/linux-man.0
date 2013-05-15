From: =?UTF-8?B?0JzQsNGA0Log0JrQvtGA0LXQvdCx0LXRgNCz?=
	<socketpair-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man 2 prctl
Date: Wed, 15 May 2013 16:05:28 +0600
Message-ID: <CAEmTpZGU4LVyXJOgyucumQLtoW4qpSi1uwjNNzGPMjiogqZ=5A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Description of PR_SET_NAME and PR_GET_NAME commands for prctl()
incorrectly says that this calls affect process. Really, these calls
affect "threads" (in other words, TID instead of PID). Therefore each
thread (i.e. TID) may have its own name.


--
Segmentation fault
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
