From: logan <logan-K1x14pM+r/KyE3HCFnH8D3xStJ4P+DSV@public.gmane.org>
Subject: Typo in cgroups(7)
Date: Tue, 26 Jul 2016 15:25:43 -0600
Message-ID: <5797D557.9020608@blackhillsinfosec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

There is a small typo in cgroups(7)

Under Tasks versus processes:

"In cgroups v1, it is possible independently manipulate the cgroup
memberships of the tasks in a process."

This should read

"In cgroups v1, it is possible *to* independently manipulate the cgroup
memberships of the tasks in a process."

Thanks for your work,
Logan L

Intern
Black Hills Information Security
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
