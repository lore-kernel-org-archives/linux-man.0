From: Fihlman Emil <emil.fihlman-uOixanVlb7U@public.gmane.org>
Subject: write(2) and write(3) ERRORS section and equivalent calls
Date: Mon, 22 Jan 2018 01:50:01 +0000
Message-ID: <a6ff3cdc013043a79202cb80a106002c@aalto.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: fi-FI
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Man pages for write(2) and write(3) should, in ERRORS section, clearly state that the errors for an equivalent calls apply and errno is set according to those equivalent calls.

Right now write(3) says in DESCRIPTION section among a sea of text:
"If fildes refers to a socket, write() shall be equivalent to send() with no flags set."

And write(2) in ERRORS section:
"Other errors may occur, depending on the object connected to fd."

As an example, if fildes is a socket and write errors with EMSGSIZE (as is possible by default in Linux, man 7 udp) documentation is unclear what happens since in write(3) equivalent calls and errno is not mentioned in the ERRORS section and in write(2) other errors are undocumented.

Emil Fihlman
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
