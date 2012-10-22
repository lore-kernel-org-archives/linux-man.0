From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: [RESEND][PATCH] prctl: update seccomp sections for mode 2 (BPF)
Date: Mon, 22 Oct 2012 23:43:25 +0200
Message-ID: <CAKgNAkjBqGn7xnncCvZ3NAUZWPWuNSDA_791s--mu_XFfJCAcQ@mail.gmail.com>
References: <20120920233700.GA3363@www.outflux.net> <CAKgNAkiYpct9iHwVC38oOF4dRizCRu0v7gwbfv5sVV1gxomuKA@mail.gmail.com>
 <CAKgNAkiS3KXB943RngX119Wwb8RTN_6i1uKRcDrr5+hn20J1qg@mail.gmail.com> <CAGXu5j+4e_NgSeUjSkFmewSzZLeiSVXcY0oCRxngmc83WWVKRg@mail.gmail.com>
Reply-To: mtk.manpages@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CAGXu5j+4e_NgSeUjSkFmewSzZLeiSVXcY0oCRxngmc83WWVKRg@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Kees Cook <keescook@chromium.org>
Cc: linux-man@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, wad@chromium.org
List-Id: linux-man@vger.kernel.org

>> If the CONFIG_SECCOMP_FILTER permits fork(), is the seccomp setting
>> inherited across fork()? Similar question for execve().
>
> Yes for both. Additionally, the filters are cumulative. (If the
> filters allows prctl, additional filters can be appended; they are run
> in order until the first non-allow result is seen.)

Thanks. I'll add some words to the man page.

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
