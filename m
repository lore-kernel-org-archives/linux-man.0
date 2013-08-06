From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 60602] clock_gettime(): Note on SMP systems outdated ?
Date: Tue, 06 Aug 2013 10:13:43 +0000
Message-ID: <bug-60602-11311-7DEwaQOiA8@https.bugzilla.kernel.org/>
References: <bug-60602-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-60602-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=60602

--- Comment #3 from Rodrigo Campos <rodrigo-aOqSs0FX/Gu4Tu3zPC53fQ@public.gmane.org> ---
Ping ?


There is a typo on my explanation on the original bug report. Where it says:

(0 << 3) | 0010 | 0100 ==> 1000 | 0010 | 0100 ==> 1110

It should be:

((~0) << 3) | 0010 | 0100 ==> 1000 | 0010 | 0100 ==> 1110

(note that zero is negated). The code does that, I just had a typo when writing
the report.

Also, Peter Ziljstra has confirmed on IRC that the note is outdated. He told me
to tell you :-)


If there is anything missing/to be fixed with the patch, please let me know




Thanks a lot,
Rodrigo

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
