Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6823E3CB546
	for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 18:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792348653; cv=pass; b=Cb1EHpD7KLpBNM5rknkBcypcqB0O7jlf/yix3OEsjMlXsX98g2VCA6VQr951vaXZVpiXnaG6ASsKwVrLLnM/kTnUIjlR8/1W2WHNuEXxcfvsmtiQC2qGUldoA141KMoDuNUmNizO7+cKLXq5siKjoqRnTbiNjsxV6VHwoUN4ZUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792348653; c=relaxed/simple;
	bh=XDWwAzB0FmYSGXI573d/uDWG0IS+jlodQYHT+L8loFw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EPabP6Lj5FrmDOor4nnukUaRmEv9WLeibVO+GcHlQmxy/q2zBerT8WNNXj0Cwab1LhPVhcJW5S/AFgvFapCiVVXWRRuE3do356B9N0WNz9gQ4B3sxa/GeIc/D4mL334AOzYqxYWayYG56C0Aj0LhB33lJ86TdIfUtKAaU6vahmk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tAq3MPj5; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tAq3MPj5"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35829219da8so2803255eec.0
        for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 11:37:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792348650; cv=none;
        d=google.com; s=arc-20260327;
        b=J4Gsi06FrT6W5+VUjdj7PDthSDEvrJuFCNIWsG8y2mJrIZSzqSFoFy7Z10bLbtvNwq
         f4OpPzigFdaKOv+SEJojBoyNxMVNS/9nssvoQG23vtkWA7ugmiiC0Dy233jc1BgJovXA
         lKpsgqR3qLwaDq5ugGVg25oU4yPvBOYh12krMjvQXqSZk2SykjL/607cu6dYuR2WZpWB
         JYfJmG9DbRv4agvy+m7FwywmRGCE54XvYugTx9hNSuvt3EG16d7Bms/d57dJIFyLWErP
         hTyQjmPIIk0YL7r2qEJqQoQxjhyyxTXYPXA9tfMlDXha70U6K20h22lKqHXW/0Gzy2oI
         0CdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p6CGmcYhUUyBtqMBb34wHFObUWh6r9WCQCyoRsqFaJ0=;
        fh=UBNN2GrUSFXIzStxPx/d+04ROyq+sIZHRXQ+qz8FZ/U=;
        b=eDz5xToEyMitv7M2i6YFYqjjqQwZ2SxM4iTlSCdiRRdOl5Z9wsd7KHBpDjUm4Qv346
         KHeP9VRRQb0A4dTD3tLOSw4BZMmfdviVCEd15SG7zmA4R9phdOP7y3DGABfQAqZUcXda
         hbP9CDqNQ5zRerjv+RJNl7TSVbZMAxzGxYABuYYxOsQUiBwBjXiS03qBOFEvwFSksWkZ
         iEs8RWJaUetxY19Mv1hgg3Wi8dVlUeLaVV87egkR2cbE4JSOcwwaBEdyQTIyXLADBwzw
         jrJ9iycH1ivxW0QP8ePJWIncopRiLHagrsrMEswQpuSv2wwt3/h1kJ2ZpxWEFTx/5Yqz
         ZK6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792348650; x=1792953450; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p6CGmcYhUUyBtqMBb34wHFObUWh6r9WCQCyoRsqFaJ0=;
        b=tAq3MPj5Z2ItNNBqLCIg+rzSDyFbpFAxpbceqIBgHZh36ngpSZqwF8ImkswkoVUvuM
         usmW8Elz8tgAN/p2fAGpKwrtPgCi3UhIalCdibChWzhc6+WQVBbdg1MHBjc6Q9e9baVF
         5OHEoUD7X/OW8e9IbKjPWmMfv7jm9xdpndNA6m9DIHszXRksu3PJXFosQhr+xY62P8f1
         cgMgYGLe/5PCksEyLQg15oBw20X6LuX81LnDyNC/IkbtbBov46IIjsaR8MSQQ6RA+Bf9
         klCQO5C/OTSKFsI6pE5j4/AE3yNl9urTtu4Xkzvkjgm+swlr2hey25l/ejvicEBPbvcM
         I+aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792348650; x=1792953450;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p6CGmcYhUUyBtqMBb34wHFObUWh6r9WCQCyoRsqFaJ0=;
        b=MX7SgxGfBvmhuu6yG8EDissjJG9gM7/533MeK87tXrLE0iO5GRw/5X/MLwcVv8sYCG
         GkFTTiLkRk30NGnf6xkUjKTDk+RUExrKhIZLuU2mp0kAb7irS1iNK4fJRz9cxpR2rwMS
         8U2qn80GlbRPzDGhKFdBW8Vd0dwjNGFG9L5RDDX2w+39dJUsArBzGoqHUKDKvo2U0ONm
         S6JRjBC6F/HmWm/ZO82DCmsHdw0BjM0p3T28Z62BSezbg3Rd5N+Q/tfz/mbfW4RWq6oX
         dDx3+2LMZi174UJOa3Frfo+wTfkUyK8I6nqGA2IEmZ89+wUhMwMDghyAcLi+WkIBFuIR
         /sYw==
X-Forwarded-Encrypted: i=1; AKwUvBzhdzSS/P4R9nHvjP6z27G1kTI/qpyYWROh0WcCkesGt8o1TnUiMgP/f0njZotkWzYiHKevljpRJ9o=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVH3UC8w//Y4JQVhRZQn22xeYJBJO5THsnabrITZ+QS4N9r9De
	E2OhZDEavIExVxmX8s/l5eN+Qlx+RFU2Fw62ILFXjIXqqs3czfhh0RrgsDaUMYsZ5KbPvNjaHTk
	ezAIoc5NCdktA+9noPTuJc6TUkrKe9mfJMOUhZqkfkCrCzSCIK1Am3SZnMUbSlw==
X-Gm-Gg: AYBFou0Q5MpUx7RKC72n6dqV5srUxB1dVhYSQ1suxsDtzHIg7AmlU/UyHp0jYPJZW79
	4oyCFvIote8N6prl+fqSEQ/j4jv30IUQ3DFNyfdRu3WuwBIbnX7McSHuI2t/JAQkBo8NLskQ6Fo
	+TpxpDACUi51mzuH5LK9Ey1S8irMfxrD2lh0AiMHdrTzzRTjXVfXc14wOSZopeAkr6lm8FNQxKK
	vveiOs9Tg3Kx9lF08MWzj7bG8KCt2QZqCDGt9zKUkVgMps0A88w7dy9CLAUGIN8pzQdm3Z2HL86
	wYnJz/LZW1C5vPNo8AXTReorsrXl2Sm/tN4Ecwa2Ro1G5mDUsSGcFTd4VugbFA2zc7wvVfIonOb
	GG570rKO7f4C9R5U82slQbGGFTdXSGKWyOIujmue1faWHSA1ON6v/Ae8kl3aVoe0edIOjrduuhi
	udew==
X-Received: by 2002:a05:7022:43a5:b0:152:dd1b:4fa7 with SMTP id
 a92af1059eb24-18511eb69acmr11312790c88.19.1792348649406; Sun, 18 Oct 2026
 11:37:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261018173712.27670-1-gnoack3000@gmail.com>
In-Reply-To: <20261018173712.27670-1-gnoack3000@gmail.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Sun, 18 Oct 2026 11:37:16 -0700
X-Gm-Features: AclHuK9Ur4tjf59m6VGsI1DePd2y32Km4FgzMB-nGrw-OFNVSN0ri8D35BWkdKI
Message-ID: <CAAVpQUCYaDWSeQormOH9SnJeiDnLanxvADGQ5WU7OkFN_zGzqA@mail.gmail.com>
Subject: Re: [PATCH v2 00/24] Documentation fixes in unix(7)
To: =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Cc: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 10:37=E2=80=AFAM G=C3=BCnther Noack <gnoack3000@gma=
il.com> wrote:
>
> Hello!
>
> This patch set fixes a variety of inaccuracies in unix(7) and related
> man pages, clarifies imprecise wording in some places, and adds
> documentation for some features where documentation was missing (PIDFD
> passing, SO_PASSRIGHTS).

Hi, thanks for working on this.


>
> Alejandro, I am sorry that you don't want to review this any further
> due to LLM use.

I understand the frustration since maintainers are getting
overwhelmed by too many AI slops these days (I'm not saying
this series is) and the review cost is way higher than before.

I'm happy to review this series as a AF_UNIX maintainer to
reduce Alejandro's cost, so please CC me on every patch, and
CC each author of (relatively) new functionality.

Also, please split the series into 3, general part (socket, bind,
protocol stuff, etc), socket diag part, and scm part (SCM_XXX,
SO_PASSXXX, etc).

It would be easier for us to review small series than a single
large series. (fwiw, netdev mailing list has ~15 patch limit)


> For the patch 06/24 where you suspected AI slop, I
> still think that the commit message was correct before as well [1],
> but I expanded it in case you want to still take that patch.
>
> I suspect you might be misjudging the level of AI involvement here;
> while the AI generated the leads on the documentation problems, and
> generated the initial fixes, I still went through this patch series
> manually for about a day to read through the associated kernel code
> and reworded them where needed.  I can answer questions on these
> commits like for any other code review as well.
>
> I'm reposting the entire series with the changes that you requested to
> 1-6, as well as some smaller commit message fixes to later commits in
> the patch set (fixed git references, added Fixes: tags, added related
> commit authors and updated their email addresses in line with the
> Linux mailmap file).
>
> If you decide to change your mind on your AI contribution policy, we
> can pick it up from here.
>
> =E2=80=93G=C3=BCnther
>
> [1] https://lore.kernel.org/all/20261018.fddfdfcb83bf@gnoack.org/
>
>
>
> Original V1 cover letter included below for references:
>
> This patch set fixes a variety of inaccuracies in unix(7) and related
> man pages, clarifies imprecise wording in some places, and adds
> documentation for some features where documentation was missing.
>
> Most parts of this patch set are unrelated to each other and can also
> be applied selectively, if you would prefer to leave some parts out.
>
> Some mentionworthy points about features that were missing or had out
> of date documentation:
>
> * Out of band messaging support (MSG_OOB):

Please drop these changes.  I planned to remove it in the next
cycle since recent AI-driven security research targets the poor
implementation, and even if the bug is trivial for the plain AF_UNIX,
MSG_OOB tends to promote it to UAF (and thus LPE) and risks
users for no good reason.


>   * This patch set removes a mention that MSG_OOB is *unsupported* in
>     unix(7) on Linux, which was factually wrong.
>   * unix(7) OOB support can be configured with CONFIG_AF_UNIX_OOB
>     and is therefore not universally available.
>   * [1] is to my knowledge the only known user - unspecified Oracle
>     products.  This was in reply to an attempt where Kuniyuki Iwashima
>     tried to remove the support.
>   * More bugs/vulnerabilities have been discovered since [2].
>   * I'm worried that documenting this (and incentivizing its use
>     further) may be counterproductive.
>
> * PIDFD passing support (SCM_PIDFD, SO_PASSPIDFD, SO_PEERPIDFD)
>   * This feature complements SCM_CREDENTIALS/SO_PEERCRED in that it
>     passed the remote PID as a PIDFD, side-stepping the PID reuse
>     problem and making it race-free.
>   * I added a commit towards the end documenting that.
>
> * SO_PASSRIGHTS (since 6.16):
>   * This default-on socket option controls whether the socket owner
>     accepts file descriptors over SCM_RIGHTS.  When it is off, the
>     sender gets an EPERM when they try.
>   * Most people don't receive file descriptors and can turn this off.
>   * When left on, the receiver process ends up being on the hook for
>     closing these FDs, and it can happen implicitly.  When an attacker
>     sends crafted file descriptors, this close operation can take long
>     (flush-on-close() semantics) and keep the receiving process busy.
>
> Some features that I did not document yet, but which are apparently
> also missing:
>
>   * Socket options:
>     * SO_PEERGROUPS
>     * SO_PEERSEC (should link to SO_PEERSEC(2const), I guess?)
>     * SO_INQ / SCM_INQ?
>     * SO_RIGHTS_NOTRUNC
>     * Options inheritance across accept(2).
>   * IOCTLS:
>     * SIOCUNIXFILE (gives an O_PATH-style FD for the remote end)
>     * SIOCOUTQ
>     * SIOCATMARK
>
> Meta-remark on LLM use:
>
> This patch set was written with the help of a LLM, in line with a
> verbally agreed exception discussed with Alejandro.  Because it is to
> my knowledge the first LLM-assisted contribution, and for full
> transparency, here are some details on how that went:
>
> The prompts had roughly the following form:
>
> 1. "Discover the factual statements in the unix.7 man page and then
>    double check them against the kernel implementation."
>    * Then, as follow up prompt: "Fix these issues in order of how
>      confident you are about the findings, in one commit each."
> 2. I asked it separately about the list of AF_UNIX features and socket
>    options that are *not* documented in unix(7) (because that was not
>    part of the original prompt).
> 3. I asked it to document the PIDFD-related options and SO_PASSRIGHTS,
>    because these seemed important features that deserve more visibility.
>
> For all prompts, the agent had access to the man page repository, the
> Linux kernel repository, as well as to a skill file (markdown
> instructions) summarizing the man page style as documented in
> man-pages(7).
>
> I then went through the list of patches, verified each against the
> kernel source, and simplified wording where necessary.  By and large,
> the wording was often good.  Corrections that I did often took the
> form of dropping too much detail, and cases where it repeated
> something in a place that should have been documented in a more
> central place only and then referenced (e.g., the Autobinding section
> in unix(7)).  A major correction I did was to keep it from documenting
> the out-of-band messaging support (see reasoning above) -- I was
> unsure whether that might be counterproductive to a potential
> deprecation of that feature (but the agent admittedly did not have
> that context).
>
> Going through these patches by hand was as tedious as it sounds,
> especially given that these agents also find issues that the human
> prompter is unfamiliar with... but it's doable.  It makes me wonder
> though whether it would be more productive to use this to flag it to
> the people who forgot to document their features...
>
> =E2=80=93G=C3=BCnther
>
>
> [1] https://lore.kernel.org/all/bef45d8e-35b7-42e4-bf6c-768da5b6d8f2@orac=
le.com/
> [2] https://projectzero.google/2025/08/from-chrome-renderer-code-exec-to-=
kernel.html
>
> G=C3=BCnther Noack (24):
>   man/man7/unix.7: ERRORS: EINVAL: The address field is sun_family, not
>     sun_type

Correct the address field s/sun_family/sun_type/

It seems the subjects are not formatted well, which makes me
feel AI cannot follow the standard and it is not worth reviewing :/


>   man/man7/unix.7: Socket options: SOL_SOCKET is a level, not a family

Describe SOL_SOCKET as socket level, not family

>   man/man7/unix.7: SO_PASSCRED: ffix

??  This reminds me of Final Fantasy IX :p

Please fix all of them.


>   man/man7/sock_diag.7: Fix member order of struct unix_diag_vfs
>   man/man7/sock_diag.7: udiag_wqueue: This is memory in use, not memory
>     available
>   man/man7/unix.7: ERRORS: EPROTONOSUPPORT: Protocol 0 is also accepted
>   man/man7/unix.7: ERRORS: ETOOMANYREFS: Fix the conditions
>   man/man7/socket.7: SO_PEEK_OFF: This option is no longer specific to
>     unix(7)
>   man/man7/unix.7: SO_PEERCRED: Also works for SOCK_SEQPACKET
>   man/man7/unix.7: SIOCINQ: Document behavior for SOCK_SEQPACKET
>   man/man7/sock_diag.7: udiag_states: Document TCP_CLOSE
>   man/man7/sock_diag.7: UNIX_DIAG_NAME: The payload is not always a
>     pathname
>   man/man7/sock_diag.7: Document UDIAG_SHOW_UID
>   man/man7/unix.7: Several items of the same type may be sent in one
>     message
>   man/man2/bind.2: ERRORS: EACCES: Write permission on the directory is
>     required
>   man/man7/unix.7: Autobind: Fix when it happens, and mention
>     SO_PASSPIDFD
>   man/man7/unix.7: SOCK_RAW is accepted as an alias for SOCK_DGRAM
>   man/man7/unix.7: SCM_SECURITY: This is not specific to SELinux
>   man/man7/unix.7: SO_PASSSEC: wfix
>   man/man7/unix.7: ERRORS: Document EACCES, EAGAIN, EMSGSIZE, ENOSPC,
>     and EPERM
>   man/man7/unix.7: Abstract sockets are scoped to a network namespace
>   man/man7/unix.7: Remove mentions of unsupported out-of-band messaging
>   man/man7/unix.7: Document SO_PASSPIDFD, SO_PEERPIDFD, and SCM_PIDFD
>   man/man7/unix.7: Document SO_PASSRIGHTS
>
>  man/man2/bind.2      |   4 +-
>  man/man7/sock_diag.7 |  40 ++++--
>  man/man7/socket.7    |  16 ++-
>  man/man7/unix.7      | 308 +++++++++++++++++++++++++++++++++++++------
>  4 files changed, 316 insertions(+), 52 deletions(-)
>
> --
> 2.56.0
>
