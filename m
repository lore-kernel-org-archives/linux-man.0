From: Presi <presidev-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: crypt (3) significant key lenght (DES, MD5, SHA)
Date: Thu, 8 Oct 2009 13:13:37 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.0910081256550.1467@luna.local.presi.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; format=flowed; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


Hello,

In current version of crypt (3) at the end of "glibc notes":

"In the SHA implementation the entire key is significant (instead of only 
the first 8 bytes in MD5)."

While in older versions with no mention to SHA:

"The entire key is significant here (instead of only the first 8 bytes)."

I understand the last sentence mean MD5 has entire key significant while 
older DES not. If this is true, I think there is a contradiction with the 
new version of manpage.

Is wrong the old version? (though I think MD5 has more than 8 bytes 
significant of the key) Can someone clarify this? or I am missing 
something?

Thanks in advance

Regards
Enrique D. Bosch 'presi'
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
