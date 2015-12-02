From: Stefan Tauner <tauner-1IEs1BiS2Ng4SCxGYwAy/16hYfS7NtTn@public.gmane.org>
Subject: erroneous scanf's %s pointer description
Date: Wed, 2 Dec 2015 13:36:43 +0100
Message-ID: <20151202133643.62758daf@tauner-w510>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

I have noticed that the description about the %s type modifier in
the official scanf man page is a bit misleading (man3/scanf.3:454). It
currently states "the next pointer must be a pointer to character
array". However the (C99) standard says "the corresponding argument
shall be a pointer to the initial element of a character array".

So IMHO the wording of the man page is sloppy at best - a pointer to an
array is not the same as a pointer to its first element (which can also
obtained by just supplying the name of the array). This led to some
confused students and lecturers here ;)

The man pages of e.g. FreeBSD and Opensolaris contain "the next pointer
must be a pointer to char" and "a pointer to the initial byte of an
array of char" respectively. I have not checked others.

KR
-- 
Dipl.-Ing. Stefan Tauner
Research and Development
Embedded Systems Department

University of Applied Sciences Technikum Wien
Hoechstaedtplatz 6, 1200 Vienna, Austria
T: +43 1 333 40 77-316
E: stefan.tauner-1IEs1BiS2Ng4SCxGYwAy/16hYfS7NtTn@public.gmane.org
I: embsys.technikum-wien.at
I: www.technikum-wien.at
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
