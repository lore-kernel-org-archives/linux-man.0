From: Bob Eggers <Bob.Eggers-C65YXLrEp3M@public.gmane.org>
Subject: (unknown)
Date: Mon, 21 Jun 2010 13:30:20 -0700
Message-ID: <460216361116404BB61933403540E169B645A3E596@ushqwmb03>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Subject: 
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

I noticed an error in and example on the man page for strncpy(). The page is http://www.kernel.org/doc/man-pages/online/pages/man3/strncpy.3.html

The error is in the section, "NOTES", specifically in the code example after the text:

      If there is no terminating null byte in the first n characters of src,
       strncpy() produces an unterminated string in dest.  Programmers often prevent
       this mistake by forcing termination as follows:

           strncpy(buf, str, n);
           if (n > 0)
               buf[n - 1]= '\0';

Substituting 1 for n and "123" for str, this would equate to:

           strncpy(buf, "123", 1);  // buf is now "1"
           if (1 > 0)
               buf[1 - 1]= '\0';                // buf is now ""

Bob Eggers--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
