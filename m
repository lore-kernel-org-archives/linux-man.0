From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: chmod man page bug - clear setuid/setgid with numerical value
Date: Tue, 21 Nov 2017 09:32:15 +0100
Message-ID: <c2002580-ec4b-5380-53be-728cb3ba852b@gmail.com>
References: <CABg1buvB_EDoUup48ahPG=ELKd3BppugRLzBFYm9QHfC-dODOg@mail.gmail.com>
 <CABg1butR8+BtGWVUsurSAyHuSzLU8TRG5cndyumMCrv+aAtjrA@mail.gmail.com>
 <CABg1buvriaHyseFHReO9bV3kLcMJXUqBFzpJqS5PDTssriVA5A@mail.gmail.com>
 <CABg1buvbngN2RvQVNbUL1kKue9-pfNboyPAKPeu9-1nRt+F1-g@mail.gmail.com>
 <CABg1butFQC6MqWpPB-WESo5ZzqzUQdHOABahy_89DUjcGSO98g@mail.gmail.com>
 <CABg1buu3KAgnKFcqf1OSdVk4+LvBJMj+RJEXJ4A6Hy7pMNaNFA@mail.gmail.com>
 <CABg1buvF+8ZhZPkH1QzQGXGhgjkBBSdvpGCV2Oi3cAuC2eLYHQ@mail.gmail.com>
 <CABg1busi0br1yXbyED3zG1pgCYfBfryACQ2dT49VRiG_Etwk8w@mail.gmail.com>
 <CABg1busWnOnmGt9ZLmdBxO-mtwUEj4ZuyJdQwxAcHqi_jQMfVg@mail.gmail.com>
 <CABg1butajSr09323zdB11Sso=iu9P8-pmJfb8DPafgjsbQ_iQg@mail.gmail.com>
 <CABg1buv5zt6aqFPa0Zem3ik4vzstk_HZ7Q-ZmwFsfkYSW_cqcQ@mail.gmail.com>
 <CABg1buv_us-MguXVTtPm8g+2K-ujbDbfsLVN7+Ya02iZVNG4Bg@mail.gmail.com>
 <CABg1buuMwZziktOxTZ-ighFYNeN2LjzWSnK4uJ_4F=RMzuHKEQ@mail.gmail.com>
 <CABg1butFxNrv28NY5+kEGso0vaV7V+YX+WZyn1ujDVKKKvwTkw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABg1butFxNrv28NY5+kEGso0vaV7V+YX+WZyn1ujDVKKKvwTkw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ol Isaac <oliverlydiaisaac-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 11/20/2017 07:55 PM, Ol Isaac wrote:
> Hello,
> 
> There is an incorrect assertion made in the chmod man page:
> 
> Under the setuid/setgid header it says, "you can set (but not clear) the
> bits with a numeric mode"
> 
> This is not entirely true. If you prefix your numeric mode with a 0 then it
> will work:
> 
> e.g.
> touch myfile
> chmod 644 myfile
> ls -l myfile
> chmod g+s myfile
> Is -l myfile
> chmod 00644 myfile
> is -l myfile
> 
> 
> This simple test shows that you can clear the uid/gid bits with numeric
> mode which is especially useful in scripts.
> 
> An update to the man page to clarify this would be helpful.

Hi Oliver,

This page is from a different project. Please see
http://man7.org/linux/man-pages/man1/chmod.1.html#COLOPHON
for info on reporting bugs there.

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
