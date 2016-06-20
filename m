From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 120671] missing info about userns restrictions
Date: Mon, 20 Jun 2016 14:36:32 +0000
Message-ID: <bug-120671-11311-ijQtFaj27a@https.bugzilla.kernel.org/>
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

--- Comment #2 from Micha=C5=82 Zegan <webczat_200-wo4oW1Pw1HF3vZ0LZ0W7Rg@public.gmane.org> ---
Well... For example, cap_sys_module does not work in user namespace, do=
esn't
it? cap_sys_mknod last i checked did not work in userns, but may be wro=
ng.
About mounting filesystems, there is probably a whitelist. If I recall
correctly you are unable to mount any block based fs like ext4 inside o=
f the
userns, like you have no permissions to mount most of them except tmpfs=
, proc
and such like. There may be other restrictions I am not aware of, but t=
hose are
some I know, unless I am wrong. It will help to clarify some things tha=
t are
just not present in that manpage.

--=20
You are receiving this mail because:
You are watching the assignee of the bug.--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
