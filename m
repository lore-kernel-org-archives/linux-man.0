From: Jonny Grant <jg-hus3n9K41k0@public.gmane.org>
Subject: symlink.2 clarification of ENOENT
Date: Thu, 9 Oct 2014 12:22:58 +0100
Message-ID: <CAGc9EvcK9fkW+zmDvbQD00h57ZsJ6o4XX=ojM+MQ+jr46FbniA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Michael

http://man7.org/linux/man-pages/man2/symlink.2.html

I saw that [linkpath] being the empty string "" also returns ENOENT. I
feel worth clariying:

Current text:
"ENOENT A directory component in linkpath does not exist or is a
              dangling symbolic link, or target is the empty string."

Proposed new text:
"ENOENT target or linkpath are empty strings. Or a directory component
in linkpath does not exist or is a dangling symbolic link."


I tested with
    result = symlink("", NULL);
    printf("symlink: '' NULL: %d, %d, '%s'\n", result, errno, strerror(errno));

Output:
symlink: '' NULL: -1, 2, 'No such file or directory'

-- 
Jonny  jg-hus3n9K41k0@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
