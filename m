From: Vivenzio Pagliari <vivenzio.pagliari-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
Subject: Broken program example in documentation to strverscmp(3)
Date: Tue, 24 Jan 2017 11:51:11 +0100
Message-ID: <20170124105110.GA25883@ulegcpvplx.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Dear Micheal Kerrisk,

the program source example shown in the current version of the strverscmp(3)
manpage is supposedly broken, as the return value of the library function is
interpreted incorrectly.

The execution of the example shows:

  $ i./a.out jan1 jan10
  jan1 < jan10

Another expected output is:

  $ i./a.out jan10 jan11
  jan10 < jan11

However, a simple change in the call unveils an unexpected result:

  $ i./a.out jan10 jan12
  jan10 > jan12

The unexpected behaviour originates from the test of the result of
strversort(): In the program code, the "less than" is tested by comparing
the function result for  equality to -1, however the test shall compare for
the function result to be less than 0, according the the documentation of
the RETURN VALUE in the manpage.

kind regards,
Vivenzio Pagliari


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
