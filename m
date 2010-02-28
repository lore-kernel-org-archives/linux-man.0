From: Jon <jg-hus3n9K41k0@public.gmane.org>
Subject: should strstr    return const char*  ?
Date: Sun, 28 Feb 2010 21:29:59 +0000
Message-ID: <4B8AE057.7000000@jguk.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi there,

A couple of queries. I hope could be considered.

I see this function on Ubuntu 9.10:

      char *strstr(const char *haystack, const char *needle);

Should it not return as const char * though?

Also could the description be clarified:

DESCRIPTION
        The strstr() function finds the first occurrence of the 
substring needle in the string haystack.  The terminating
        '\0' characters are not compared.


Can this be added: "If needle is longer than haystack it will never 
match. When the search reaches a character position in haystack which 
does not leave enough characters left to compare, searching will end, 
the haystack buffer will not be overrun.

Thanks again for considering this.
Cheers, Jon
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
