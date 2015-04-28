From: Weijie Yang <weijie.yang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [update report]proc.5:  account pmd page tables to the process
Date: Tue, 28 Apr 2015 16:47:00 +0800
Message-ID: <"000001d08190$019414e0$04bc3ea0$@yang"@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-language: zh-cn
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 'Weijie Yang' <weijie.yang.kh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Since kernel v4.0, pmd page account is added into /proc/[pid]/status

See detail:
commit dc6c9a35b66b520cf67e05d8ca60ebecad3b0479
Author: Kirill A. Shutemov <kirill.shutemov-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Date:   Wed Feb 11 15:26:50 2015 -0800

    mm: account pmd page tables to the process


I don't find a description for it when I read the latest man-page, so I send this email.
Maybe there is already a plan for it and I miss it, anyway, I send this report.

Regards

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
