From: Ed Avis <eda-0aTcAJqSNDHby3iVrkZq2A@public.gmane.org>
Subject: strtod(3) manual page not clear on error handling when endptr is
 null
Date: Thu, 28 Apr 2016 16:31:45 +0000
Message-ID: <7E039918541B4C4183BFDB8F015C7430DEB54FB3@WCL-EXCH02.wcl.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "'mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org'" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "'linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org'" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

strtod(3) says:

>If no conversion is performed, zero is returned and the value of nptr is stored in the location referenced by endptr.

This surely can't be the case if endptr is null.  I believe that the behaviour is more like

>If no conversion is performed, zero is returned, and (unless endptr is null) the value of nptr is stored in the location referenced by endptr.

-- 
Ed Avis <eda-0aTcAJqSNDHby3iVrkZq2A@public.gmane.org>


This email is intended only for the person to whom it is addressed and may contain confidential information. Any retransmission, copying, disclosure or other use of, this information by persons other than the intended recipient is prohibited. If you received this email in error, please contact the sender and delete the material. This email is for information only and is not intended as an offer or solicitation for the purchase or sale of any financial instrument. Wadhwani Asset Management LLP is a Limited Liability Partnership registered in England (OC303168) with registered office at 40 Berkeley Square, 3rd Floor, London, W1J 5AL. It is authorised and regulated by the Financial Conduct Authority.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
