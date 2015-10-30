From: Mike Mestnik <cheako-2RaclcuBPGKiK054olCwYw@public.gmane.org>
Subject: strtok: posturing: Last item is returned as delimited, even if it is not.
Date: Fri, 30 Oct 2015 17:43:56 -0500
Message-ID: <CAF8px57Td+X21+LvLUzKXcV0quzMBzZa9oRVhAzHHXKK-8G6mQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

github reference:
https://github.com/cheako/ihlt/commit/ecf0b29fdb0aa127a555f2fafa57f194563e4ed2#diff-0235f01a49d01b35e981a41f59a9d2d6R48

an example client, illustrates the desired effect:
https://github.com/cheako/ihlt/commit/8f8eb2222a5ee6cb62f901afc6d2232d8c6f9b47#diff-6fbb7f44f186dbc200f4f149d8c13132R49

effect:
s/ +/,/g, s/[\r\n]+/!\n/g

Despite the working code that illustrates that strtok does tokenize
the last part of a string that's not delimited, the man page does not
address the possibility, instead it indicates that tokens must be
delimited.

Note: URIs with line numbers would be helpful.
http://man7.org/linux/man-pages/man3/strtok.3.html

"The start of the
       next token is determined by scanning forward for the next
       nondelimiter byte in str.  If such a byte is found, it is taken as
       the start of the next token.  If no such byte is found, then there
       are no more tokens, and strtok() returns NULL."

This would be more accurate:

The start of the
       next token is determined by scanning forward for the next
       nondelimiter byte in str.  If such a byte is found, it is taken as
       the start of the next token.

I'm unsure of how this situation can be explained, it creates a mess
of code attempting to use strtok.  In my example the for loop is what
I consider upside down and it's just plain uggly hack  to discover if
the token found was the end of the string and not a token.

Cheers.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
