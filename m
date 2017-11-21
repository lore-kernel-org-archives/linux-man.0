From: OL Isaac <oliverlydiaisaac-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: chmod man page bug - clear setuid/setgid with numerical value
Date: Mon, 20 Nov 2017 20:08:05 -0600
Message-ID: <6559B723-A745-4A07-B220-C8AB5124466C@gmail.com>
References: <CABg1buvB_EDoUup48ahPG=ELKd3BppugRLzBFYm9QHfC-dODOg@mail.gmail.com>
 <CABg1busG-pck5g_M-OuH7uAN0UgKpA5SJdxu5XbmrGn_4x4iuQ@mail.gmail.com>
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
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABg1buuMwZziktOxTZ-ighFYNeN2LjzWSnK4uJ_4F=RMzuHKEQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello,

There is an incorrect assertion made in the chmod man page:

Under the setuid/setgid header it says, "you can set (but not clear) the =
bits with a numeric mode"

This is not entirely true. If you prefix your numeric mode with a 0 then =
it will work:

e.g.
touch myfile
chmod 644 myfile
ls -l myfile
chmod g+s myfile
Is -l myfile
chmod 00644 myfile
is -l myfile


This simple test shows that you can clear the uid/gid bits with numeric =
mode which is especially useful in scripts.

An update to the man page to clarify this would be helpful.=20

Thanks,
Oliver=20=
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
