From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Documentation for LD_USE_LOAD_BIAS
Date: Mon, 27 Oct 2008 17:13:01 -0500
Message-ID: <cfd18e0f0810271513m77840afbre789eb130c10e93b@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jakub-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Jakub,

I noticed that ld.so(8) doesn't document LD_USE_LOAD_BIAS, so I drew
heavily on your
http://sources.redhat.com/ml/libc-hacker/2003-11/msg00127.html
to write the following:

       LD_USE_LOAD_BIAS
              By default (i.e., if this variable is not defined)  exe-
              cutables  and  prelinked  shared objects will honor base
              addresses of their  dependent  libraries  and  (non-pre-
              linked)   position-independent  executables  (PIEs)  and
              other  shared  objects  will   not   honor   them.    If
              LD_USE_LOAD_BIAS is defined wit the value, both executa-
              bles  and  PIEs  will  honor  the  base  addresses.   If
              LD_USE_LOAD_BIAS  is  defined  with the value 0, neither
              executables nor PIEs  will  honor  the  base  addresses.
              This variable is ignored by set-user-ID and set-group-ID
              programs.

Could you check this over and tell me if it looks okay?

Cheers,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
