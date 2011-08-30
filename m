From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 42042] New: strchr(3) and memchr(3) should explain behaviour
 when character 'c' is '\0'.
Date: Tue, 30 Aug 2011 13:18:14 GMT
Message-ID: <bug-42042-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=42042

           Summary: strchr(3) and memchr(3) should explain behaviour when
                    character 'c' is '\0'.
           Product: Documentation
           Version: unspecified
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
        AssignedTo: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
        ReportedBy: jamesodhunt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        Regression: No


PROBLEM
-------

strchr(3) and memchr(3) do not explain the behaviour if the character to search
for is specified as a null character ('\0'). According to my copy of Harbison
and Steele, since the terminator is considered part of the string, a call such
as:

  strchr("hello", '\0')

... will return the address of the terminating null in the specified string.

RATIONALE
---------

strchr(3) and memchr(3) are inconsistent with index(3) which states:

  "The terminating NULL character is considered to be a part of the strings."

Adding such a note to strchr(3) and memchr(3) is also important since it is not
unreasonable to assume that strchr() will return NULL in this scenario. This
leads to code like the following which is guaranteed to fail should
get_a_char() return '\0':


  char string[] = "hello, world";
  int c = get_a_char();

  if (! strchr(string, c))
    fprintf(stderr, "failed to find character in string\n");


SUGGESTED UPDATE
----------------

I'd suggest adding something like the following to strchr(3) and memchr(3):

  If 'c' is '\0' (the terminating null character), strchr() will return the
  address of the terminating null character in 's'.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
