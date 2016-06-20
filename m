From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 120671] missing info about userns restrictions
Date: Mon, 20 Jun 2016 20:32:34 +0000
Message-ID: <bug-120671-11311-VG0HbtSHYJ@https.bugzilla.kernel.org/>
References: <bug-120671-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-120671-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D120671

--- Comment #5 from Micha=C5=82 Zegan <webczat_200-wo4oW1Pw1HF3vZ0LZ0W7Rg@public.gmane.org> ---
yes, what I mean is just to make soe things more detailed in case someo=
ne
wonders.
About filesystes, you can try to test mounting an ext4 filesystem after=
 doing
unshare of both userns and mountns, almost sure you will fail. I mean m=
ounting
the fs from inside of the ns. I may test that too when I have time, to =
be sure,
but I am almost certain that is the case, especially that mounting an a=
rbitrary
fs could be a security risk because uids are not shifted.

--=20
You are receiving this mail because:
You are watching the assignee of the bug.--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
