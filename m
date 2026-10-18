Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F49A37DAAE
	for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 17:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792345039; cv=none; b=doJYNuwWBcGhJe2ETkyZoFvKHrOGP5XeElaUP1PQgElDx2LSXH3+nN1Twkagnbf68VzJ8bBXPLdYFGjzC1RILg3gI4LhwLkbA4XG0ZqGbtEF08XbYEpblkPyGdd03zka3wTUm2X5TSygfWhxkBVmuJTqz2UBU8bGFYxlz75qOt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792345039; c=relaxed/simple;
	bh=I40geHpIlMsSHmzY5+qlrB5xxzZHlHWGpMluLnOekS8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JPQUjYH+9o3oHk3erH2SCJdLSUNNcArtzEyGavatrfkEVE7k7/SYoPhWVOIMOo9GP8/MgcTuFDiIqXOfZFynT2cEen6O7hso5aoML032dxsID9RFIcqbQ979sdvp7TD/L3ZFWrcc2AjN56bd7qT0Th46IGD5MT0rBsdqgrAIBcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qfcMXb5j; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qfcMXb5j"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1d484b4a9so19242355e9.0
        for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 10:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792345036; x=1792949836; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o0Gt3hOAZo/dezYE5g1Yt0HzhuqWjIVZ81Krp+LwrcI=;
        b=qfcMXb5j+S0ytJySCMg045209qCSN14r4ev0u+gbeXC6iU6R3JJJV3dOvl+RCeigHr
         MThCjevOb3VaCYNjdToW9+B3gqHC+mEvGPNfhEJpArOG2h6h9txMyDwsZUr1pWdpVut4
         9RFM4u9gbcjr8dSAN0n3tUZipUv9GH2TOQ2QC/SDhBhiWXyxl2KhzrCmtOhgdp0/1Yt6
         tL0BD2J8ybM9KjDXMowRmHUaEE5DRukVLnylBIrynQaBOlHpr+a174ito/Q19xT1LhCO
         fcQzmCZvhN8fX3ZYhIyEpYpWIpelIDnJ5z7r5cDgel3yU1LHpxmp5w1vaDip46XiYqa0
         57Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792345036; x=1792949836;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o0Gt3hOAZo/dezYE5g1Yt0HzhuqWjIVZ81Krp+LwrcI=;
        b=U+BekBtawjaO+iOrUk5KBn3vOmbozo7iF1X6i1zNRuOrjOk/Cffo+0ybRJhvefb3Jl
         3tDIMDCzKb1dPj+Y3pgfi17h9ZqJxJZenj7eDbYyueXcWWC4vwUJMsRNUtNBzQTBEwKX
         C8V0t54vdYIQmZoaEKeeQtu5l/0JvAlnLznSWuoM9Ex7QVZQCLSqZ+9UIHCotDjYmDvb
         llzntFNe6OwOYyS26Nlo+br3rD7h46HdVMciAxcPnT8YTYoFfqFygK4Sp8mQO/vh94yD
         Ob5Pzu+YE0niKjRbvOQUSwh5uJ+W5v+qfiGCFa5LfleDCRLf+Pg5i9HAIc7hIgkSQ83x
         k5Iw==
X-Gm-Message-State: AFq9FYLwJ9sWLugcBR+4trQ74o4qtRfIuNrYgXj2jkoInQhG6wIa6Y24
	ywPia0Z6RyD4YRMlAH2DC8STktDN8P4vwjLGTnvDzS/TkVXy8AQ9rw3E
X-Gm-Gg: AYBFou2m5Qel4TA7btZMZlZQd5ZuPYabzonWIh2kwXDmJ3kBRGLIdhQfVPEzb19S8SH
	jpLYxIVpkoMZZZZlM0vpO6vdCdEjF1idMaMXsvBmLnrX78SWrm8e/16LsCuaUO6HBMdvaDiI8TA
	qDT+zlhIqnZpZc/amK/Y1rTff2gzjYUL9YUL/Xc5eGD0KBFkfDnM+MqNtt7q99kclcaCWnQ/KU0
	oqM7tCah4UKuuLd15vO6NinA8UMYu6mmvAZq3Hr2PxuOmfOyHJ8yDfBcjHTiBnWixDPjI7BOW2c
	MvzQqrGUUsTeoXg2yt3U1Zm+IaPf85yvycjUQ07jssU5JlfVzjMTHDnHc15uSOmHpYaPUQB9gKP
	Rghd/F4LWy5lrmN3iQPFJFXFWqvZo0gYVRlfcY15bwUD1Lh10uKz7mslGEduHcSqn6LSJXZJndB
	u0UfaVCjqnIwNXn5+3UkVNpHs4QI8N+fQCqUEdu4vnb+d5l2ssuhbiR0ete9t1p0rGLaJdoVwot
	J2KUXz8dy7DscSXEc0wp8s=
X-Received: by 2002:a05:600c:4e8a:b0:49f:ffd0:4039 with SMTP id 5b1f17b1804b1-4a1d763ca4amr109292525e9.32.1792345035612;
        Sun, 18 Oct 2026 10:37:15 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bdc036a4sm343957935e9.11.2026.10.18.10.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:37:15 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	kuniyu@google.com
Subject: [PATCH v2 00/24] Documentation fixes in unix(7)
Date: Sun, 18 Oct 2026 19:36:48 +0200
Message-ID: <20261018173712.27670-1-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello!

This patch set fixes a variety of inaccuracies in unix(7) and related
man pages, clarifies imprecise wording in some places, and adds
documentation for some features where documentation was missing (PIDFD
passing, SO_PASSRIGHTS).

Alejandro, I am sorry that you don't want to review this any further
due to LLM use.  For the patch 06/24 where you suspected AI slop, I
still think that the commit message was correct before as well [1],
but I expanded it in case you want to still take that patch.

I suspect you might be misjudging the level of AI involvement here;
while the AI generated the leads on the documentation problems, and
generated the initial fixes, I still went through this patch series
manually for about a day to read through the associated kernel code
and reworded them where needed.  I can answer questions on these
commits like for any other code review as well.

I'm reposting the entire series with the changes that you requested to
1-6, as well as some smaller commit message fixes to later commits in
the patch set (fixed git references, added Fixes: tags, added related
commit authors and updated their email addresses in line with the
Linux mailmap file).

If you decide to change your mind on your AI contribution policy, we
can pick it up from here.

–Günther

[1] https://lore.kernel.org/all/20261018.fddfdfcb83bf@gnoack.org/



Original V1 cover letter included below for references:

This patch set fixes a variety of inaccuracies in unix(7) and related
man pages, clarifies imprecise wording in some places, and adds
documentation for some features where documentation was missing.

Most parts of this patch set are unrelated to each other and can also
be applied selectively, if you would prefer to leave some parts out.

Some mentionworthy points about features that were missing or had out
of date documentation:

* Out of band messaging support (MSG_OOB):
  * This patch set removes a mention that MSG_OOB is *unsupported* in
    unix(7) on Linux, which was factually wrong.
  * unix(7) OOB support can be configured with CONFIG_AF_UNIX_OOB
    and is therefore not universally available.
  * [1] is to my knowledge the only known user - unspecified Oracle
    products.  This was in reply to an attempt where Kuniyuki Iwashima
    tried to remove the support.
  * More bugs/vulnerabilities have been discovered since [2].
  * I'm worried that documenting this (and incentivizing its use
    further) may be counterproductive.

* PIDFD passing support (SCM_PIDFD, SO_PASSPIDFD, SO_PEERPIDFD)
  * This feature complements SCM_CREDENTIALS/SO_PEERCRED in that it
    passed the remote PID as a PIDFD, side-stepping the PID reuse
    problem and making it race-free.
  * I added a commit towards the end documenting that.

* SO_PASSRIGHTS (since 6.16):
  * This default-on socket option controls whether the socket owner
    accepts file descriptors over SCM_RIGHTS.  When it is off, the
    sender gets an EPERM when they try.
  * Most people don't receive file descriptors and can turn this off.
  * When left on, the receiver process ends up being on the hook for
    closing these FDs, and it can happen implicitly.  When an attacker
    sends crafted file descriptors, this close operation can take long
    (flush-on-close() semantics) and keep the receiving process busy.

Some features that I did not document yet, but which are apparently
also missing:

  * Socket options:
    * SO_PEERGROUPS
    * SO_PEERSEC (should link to SO_PEERSEC(2const), I guess?)
    * SO_INQ / SCM_INQ?
    * SO_RIGHTS_NOTRUNC
    * Options inheritance across accept(2).
  * IOCTLS:
    * SIOCUNIXFILE (gives an O_PATH-style FD for the remote end)
    * SIOCOUTQ
    * SIOCATMARK

Meta-remark on LLM use:

This patch set was written with the help of a LLM, in line with a
verbally agreed exception discussed with Alejandro.  Because it is to
my knowledge the first LLM-assisted contribution, and for full
transparency, here are some details on how that went:

The prompts had roughly the following form:

1. "Discover the factual statements in the unix.7 man page and then
   double check them against the kernel implementation."
   * Then, as follow up prompt: "Fix these issues in order of how
     confident you are about the findings, in one commit each."
2. I asked it separately about the list of AF_UNIX features and socket
   options that are *not* documented in unix(7) (because that was not
   part of the original prompt).
3. I asked it to document the PIDFD-related options and SO_PASSRIGHTS,
   because these seemed important features that deserve more visibility.

For all prompts, the agent had access to the man page repository, the
Linux kernel repository, as well as to a skill file (markdown
instructions) summarizing the man page style as documented in
man-pages(7).

I then went through the list of patches, verified each against the
kernel source, and simplified wording where necessary.  By and large,
the wording was often good.  Corrections that I did often took the
form of dropping too much detail, and cases where it repeated
something in a place that should have been documented in a more
central place only and then referenced (e.g., the Autobinding section
in unix(7)).  A major correction I did was to keep it from documenting
the out-of-band messaging support (see reasoning above) -- I was
unsure whether that might be counterproductive to a potential
deprecation of that feature (but the agent admittedly did not have
that context).

Going through these patches by hand was as tedious as it sounds,
especially given that these agents also find issues that the human
prompter is unfamiliar with... but it's doable.  It makes me wonder
though whether it would be more productive to use this to flag it to
the people who forgot to document their features...

–Günther


[1] https://lore.kernel.org/all/bef45d8e-35b7-42e4-bf6c-768da5b6d8f2@oracle.com/
[2] https://projectzero.google/2025/08/from-chrome-renderer-code-exec-to-kernel.html

Günther Noack (24):
  man/man7/unix.7: ERRORS: EINVAL: The address field is sun_family, not
    sun_type
  man/man7/unix.7: Socket options: SOL_SOCKET is a level, not a family
  man/man7/unix.7: SO_PASSCRED: ffix
  man/man7/sock_diag.7: Fix member order of struct unix_diag_vfs
  man/man7/sock_diag.7: udiag_wqueue: This is memory in use, not memory
    available
  man/man7/unix.7: ERRORS: EPROTONOSUPPORT: Protocol 0 is also accepted
  man/man7/unix.7: ERRORS: ETOOMANYREFS: Fix the conditions
  man/man7/socket.7: SO_PEEK_OFF: This option is no longer specific to
    unix(7)
  man/man7/unix.7: SO_PEERCRED: Also works for SOCK_SEQPACKET
  man/man7/unix.7: SIOCINQ: Document behavior for SOCK_SEQPACKET
  man/man7/sock_diag.7: udiag_states: Document TCP_CLOSE
  man/man7/sock_diag.7: UNIX_DIAG_NAME: The payload is not always a
    pathname
  man/man7/sock_diag.7: Document UDIAG_SHOW_UID
  man/man7/unix.7: Several items of the same type may be sent in one
    message
  man/man2/bind.2: ERRORS: EACCES: Write permission on the directory is
    required
  man/man7/unix.7: Autobind: Fix when it happens, and mention
    SO_PASSPIDFD
  man/man7/unix.7: SOCK_RAW is accepted as an alias for SOCK_DGRAM
  man/man7/unix.7: SCM_SECURITY: This is not specific to SELinux
  man/man7/unix.7: SO_PASSSEC: wfix
  man/man7/unix.7: ERRORS: Document EACCES, EAGAIN, EMSGSIZE, ENOSPC,
    and EPERM
  man/man7/unix.7: Abstract sockets are scoped to a network namespace
  man/man7/unix.7: Remove mentions of unsupported out-of-band messaging
  man/man7/unix.7: Document SO_PASSPIDFD, SO_PEERPIDFD, and SCM_PIDFD
  man/man7/unix.7: Document SO_PASSRIGHTS

 man/man2/bind.2      |   4 +-
 man/man7/sock_diag.7 |  40 ++++--
 man/man7/socket.7    |  16 ++-
 man/man7/unix.7      | 308 +++++++++++++++++++++++++++++++++++++------
 4 files changed, 316 insertions(+), 52 deletions(-)

-- 
2.56.0

