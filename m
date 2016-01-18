From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug
 104511]=?UTF-8?Q?=20Add=20=E2=80=9Clocale=20=2Dc=20charmap=E2=80=9D=20as=20an=20example=20to=20locale?=(1)
Date: Mon, 18 Jan 2016 08:09:58 +0000
Message-ID: <bug-104511-11311-eaOM1Phhv9@https.bugzilla.kernel.org/>
References: <bug-104511-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-104511-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=104511

Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org

--- Comment #1 from Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> ---
Hi Florian,

The first example is:

       $ locale
       LANG=en_US.UTF-8
       LC_CTYPE="en_US.UTF-8"
       ...

And there the encoding listed matches the charset in use, do you think an
additional example would still be warranted?

http://man7.org/linux/man-pages/man1/locale.1.html

Thanks.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
