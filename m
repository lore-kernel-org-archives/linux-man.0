From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 69771] crypt may return EPERM and/or EINVAL
Date: Wed, 26 Feb 2014 17:02:58 +0000
Message-ID: <bug-69771-11311-DNdbOIIH4y@https.bugzilla.kernel.org/>
References: <bug-69771-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-69771-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=69771

--- Comment #2 from KOSAKI Motohiro <kosaki.motohiro-+CUm20s59erQFUHtdCDX3A@public.gmane.org> ---
>Thanks, for the report Motohiro. I added these texts:
>
>       EINVAL salt has the wrong format.
>
>       EPERM  /proc/sys/crypto/fips_enabled has a nonzero value, and an
>              attempt  was  made to use a weak encryption type, such as
>              DES.
>
>Okay?

Yes, thanks.


>Just for future reports: to help me verify details, pointers to the relevant >source files would save me doing some hunting. (I did find them after a little >searching, in this case)

Oops. Sorry about that. Yes, I'll do that.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
