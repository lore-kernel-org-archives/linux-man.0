From: Gioele Barabucci <gioele-jeERWPXkMA9eoWH0uzbU5w@public.gmane.org>
Subject: locale({1,5}) should describe LANG and LANGUAGE
Date: Wed, 17 Aug 2011 16:18:03 +0200
Message-ID: <4E4BCD9B.1030705@svario.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: submit-61a8vm9lEZVf4u+23C9RwQ@public.gmane.org, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Package: manpages
Version: 3.23

The man page for `locale(1)` do not describe the LANG and LANGUAGE 
environment variables. `environ(7)` describes only LANG and refers to 
`locale(5)` for further explaination. `locale(5)` do not describe 
neither LANG or LANGUAGE.

Both LANG and LANGUAGE are described in LSB 4.0, although not in depth.

Shouldn't the meaning and the format of LANG and LANGUAGE and the 
difference between these two environment variables be explained in 
`locale` manpages?

Regards,

-- 
Gioele Barabucci <gioele-jeERWPXkMA9eoWH0uzbU5w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
