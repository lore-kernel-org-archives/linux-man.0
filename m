From: Karl Williamson <public-/DvU5TCGPCfudgbIoQcpSA@public.gmane.org>
Subject: nl_langinfo man page has several errors
Date: Mon, 31 Jul 2017 22:41:31 -0600
Message-ID: <86ca4f5d-9a9f-08a9-7847-fe7258d603b5@khwilliamson.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The DESCRIPTION says

  The  nl_langinfo()  and  nl_langinfo_l()  functions  provide  access to
         locale information in a more flexible way than localeconv(3). 
nl_lang‐
         info() returns a string which is the value corresponding to 
item in the
         program's current global locale.  nl_langinfo() returns a 
string  which
         is  the  value  corresponding  to item for the locale 
identified by the
         locale object locale, which was  previously  created  by 
newlocale(1).
         Individual  and  additional  elements  of  the locale 
categories can be
         queried.  setlocale(3) needs  to  be  executed  with  proper 
arguments
         before.

Notice that it says two different things about nl_langinfo, and none 
about nl_langinfo_l.

And it's wrong.  I looked at the implementation, and these functions 
follow the paradigm of things like isalnum(), which is what one hopes 
they do.

nl_langinfo looks first for a thread-specific locale object, and only if 
not found does it fall back to the global one.  Neither of the two 
sentences say this.

The final sentence is also wrong.  Either setlocale or uselocale should 
have been done on the category or object needed.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
