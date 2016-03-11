From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 94271] fcntl.2 and pipe.7 need to say more about use of O_ASYNC
Date: Fri, 11 Mar 2016 06:59:07 +0000
Message-ID: <bug-94271-11311-KOxytgCiZF@https.bugzilla.kernel.org/>
References: <bug-94271-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-94271-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D94271

Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
-----------------------------------------------------------------------=
-----
             Status|NEW                         |RESOLVED
                 CC|                            |mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         Resolution|---                         |CODE_FIX

--- Comment #1 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I reworked a paragraph in fcntl(2) to:

              As  well  as setting the file descriptor owner, one must
              also enable generation of signals on the  file  descrip=E2=
=80=90
              tor.   This is done by using the fcntl() F_SETFL command
              to set the O_ASYNC file status flag on the file descrip=E2=
=80=90
              tor.   Subsequently,  a  SIGIO  signal  is sent whenever
              input or output becomes possible on the file descriptor.
              The  fcntl()  F_SETSIG  command  can  be  used to obtain
              delivery of a signal other than SIGIO.

And a paragraph in pipe(7) to:

       Setting the O_ASYNC flag for the read end of a  pipe  causes  a
       signal  (SIGIO  by  default)  to  be  generated  when new input
       becomes available on the pipe.  The target for delivery of sig=E2=
=80=90
       nals  must  be  set  using  the  fcntl(2) F_SETOWN command.  On
       Linux, O_ASYNC is supported for pipes and FIFOs only since ker=E2=
=80=90
       nel 2.6.

I think that probably suffices(?). So, I'll close this bug.

--=20
You are receiving this mail because:
You are watching the assignee of the bug.--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
