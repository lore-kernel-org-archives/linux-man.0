From: Ulrich Drepper <drepper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Typo in rtld-audit
Date: Thu, 21 Jun 2012 11:36:45 -0400
Message-ID: <CAOPLpQeK4VQKqDiURG8UkhF=1dEbmOGyXezMB0c=dPSomeDegw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The description for la_symbind* says:

If the auditing library is simply monitoring symbol bindings, then  it
 should return  sym->st_name.

This should be "sym->st_value".  The example in the end gets it right.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
