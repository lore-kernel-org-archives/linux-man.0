From: Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Subject: Is there a way to get "EINVAL" style string
Date: Sun, 22 Apr 2012 12:14:04 +0100
Message-ID: <4F93E7FC.1020904@jguk.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello

I was looking at the man pages looking for a way to get a string of the 
errno value meaning. This is kind of a user question.

This API returns "returns a pointer to a string that describes the error 
code":

http://man7.org/linux/man-pages/man3/strerror.3.html

However, this is a description, e.g. "Invalid argument".  Is there a 
function that would return "EINVAL" or "ENOENT" as the string?

Could I suggest that the text on the man page be updated to clarify what 
would be returned:

"returns a pointer to a string that describes the error code. e.g. 
"Invalid argument" if EINVAL was the errnum."

Best regards, Jon
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
