From: walter harms <wharms-fPG8STNUNVg@public.gmane.org>
Subject: example in fmemopen.3
Date: Fri, 28 May 2010 16:31:43 +0200
Message-ID: <4BFFD3CF.2070608@bfs.de>
Reply-To: wharms-fPG8STNUNVg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

 Hi,
the error message in the fmemopen example is confusing

          in = fmemopen(argv[1], strlen(argv[1]), "r");
           if (in == NULL)
               handle_error("fmemopen");

           out = open_memstream(&ptr, &size);
           if (out == NULL)
               handle_error("fmemopen");
			^^^^^^^^^^^^^^^^^

perhaps 	handle_error("open_memstream"); is intended ?

re,
 wh
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
