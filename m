From: =?UTF-8?B?0JzQsNGA0Log0JrQvtGA0LXQvdCx0LXRgNCz?=
	<socketpair-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: prctl(PR_SET_PDEATHSIG) + execve
Date: Mon, 10 Feb 2014 11:30:35 +0600
Message-ID: <CAEmTpZESE8f_0vyqBhWYfH_kE33onhZTjMV5j84rv2OZEgguSQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk-manpages <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

prctl(PR_SET_PDEATHSIG):

It is not said explicitly that this preference is preserved after execve().

-- 
Segmentation fault
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
