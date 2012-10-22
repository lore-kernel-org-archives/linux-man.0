From: Kees Cook <keescook@chromium.org>
Subject: Re: [RESEND][PATCH] prctl: update seccomp sections for mode 2 (BPF)
Date: Mon, 22 Oct 2012 08:15:33 -0700
Message-ID: <CAGXu5j+4e_NgSeUjSkFmewSzZLeiSVXcY0oCRxngmc83WWVKRg@mail.gmail.com>
References: <20120920233700.GA3363@www.outflux.net>
	<CAKgNAkiYpct9iHwVC38oOF4dRizCRu0v7gwbfv5sVV1gxomuKA@mail.gmail.com>
	<CAKgNAkiS3KXB943RngX119Wwb8RTN_6i1uKRcDrr5+hn20J1qg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CAKgNAkiS3KXB943RngX119Wwb8RTN_6i1uKRcDrr5+hn20J1qg@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: mtk.manpages@gmail.com
Cc: linux-man@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, wad@chromium.org
List-Id: linux-man@vger.kernel.org

On Mon, Oct 22, 2012 at 12:34 AM, Michael Kerrisk (man-pages)
<mtk.manpages@gmail.com> wrote:
> Kees,
>
> A couple of questions about SECCOMP_MODE_FILTER.
>
> I added some words that the arg3 is a pointer to 'struct fprog'. Can
> you confirmn that's correct?

Correct. Good idea to add this detail.

> If the CONFIG_SECCOMP_FILTER permits fork(), is the seccomp setting
> inherited across fork()? Similar question for execve().

Yes for both. Additionally, the filters are cumulative. (If the
filters allows prctl, additional filters can be appended; they are run
in order until the first non-allow result is seen.)

-Kees

-- 
Kees Cook
Chrome OS Security
