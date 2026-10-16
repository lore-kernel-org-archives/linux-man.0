Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7D458B6D9
	for <linux-man@vger.kernel.org>; Fri, 16 Oct 2026 17:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792171944; cv=none; b=BEf2KxzFJLKA0tf68sr5OHbEyhKhjS9B5HaUuG98zKzLzgbu8WdVk5jCai7ivCsryXUqwAOQ8K10YqmpeQMm4zMEGmvLVp41YPP77acK2w7JVEp4SXLQbWmsnMJ8wSalFuGXFHe7M4N6khMHiylOdxlXH43YMQL+aTct0ZjqtQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792171944; c=relaxed/simple;
	bh=BF4ZPem5eFKeJYZgn1m7+O2kV5onymocauhYAghJ6b0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OJ23J0Dkv9/y2V+SH/Xwuj64Cd2KkrJAjsTO2+1QygtzR38S23+qaa2vU3iAofMRDm0v64K77rhGjSbx+SOOQ7Dy8c4zKKfFvnDFilWvixHBMZaNOgMA4+XbxB6w/ik8doIrg1j6BYAzOpcUuWofVuQFPeB70lFyDLSU5aIJoTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f8mI9E9V; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f8mI9E9V"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48c5358fc28so73919f8f.0
        for <linux-man@vger.kernel.org>; Fri, 16 Oct 2026 10:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792171940; x=1792776740; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Ji73mcF84gJDvVvUjQy26q7xcmMZ1puyRaL9r9O8rM=;
        b=f8mI9E9VfvvaXLCZ73rl9NjBMKCokm832dCccBNTFqlylvG7gUzVKUUpZHb4FInfmT
         eRuV2aTsNTNKEaGxRnRjq87n1nbRRjV2SpV3skaJhxO6baKRggkHyYKqbA1puPv9DNnl
         L0iubqAzwrSWt+XBPxGeris5BKQ10vnN632Tnws/Qw0+eP3PA5X2+843I7qKiA43Y1lP
         LQ0SBK7R8G/m0v94WXxhpwX6s/m0aFiMICXYb6cb70wMct/IhNwSsy2cxKMGXaVq+LWS
         wKARIYy2ipW/UUI9YwtXIZa3q/JcMxv+fpQyuha3Jzq2D/bOvOZwgqBnFijk9+TbZPrK
         UQZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792171940; x=1792776740;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9Ji73mcF84gJDvVvUjQy26q7xcmMZ1puyRaL9r9O8rM=;
        b=nlXzZJoAsoX3Z4zFCBJEroU8/D9xukLwSlFpcat6njNk7RoX0KOPwy/K+g3IwQ8APW
         PNmgOr1x/1OFvqDtRPEBZg8Vskx7TH9puPFbioabKeRmFN8FBLB2NEqd49mJOgtV/61k
         dCcqnRjNruHwxR0IDQqXdsiMSPfuLaYp/IST2skmY2ugDwdVKVyozEwevHR1r3xdQWls
         w31O/SZixHExhjOvtA7bd5gFOSzUC+SasKXskxCUKCN8ymvgjFAHHJU++DBXs5JBn4l9
         OJnLs4wUlOMeR8PsRo4n6moEdJpTzj0rG+5fGEA9knUruhiSJMwfpu7L/O5UaYqZsgfd
         dHtg==
X-Gm-Message-State: AFq9FYI7pnSexO8F79zynz989dwkWjdpUPua/uWDOJr6Cvvnh4pKwoFz
	MQj5fa1q8zn6dIjpCa31dUGXyG/jsvs0c+35IurNqY57e6z7C+0UHu+dvB/b7onG
X-Gm-Gg: AYBFou0bja5f1ZCUoKa+M7RJkLrQEDHt/1mZI7olTIBUzuWGbgBOoKEjiIvehLIjEjR
	VZ23navtRRwS64inRpswJV7UKAo0jRBu/DjeJFBvs7ee97ICqJsRN9RbRIGSFs00FCVJVR/MUYa
	51DVSgCvrvLtxNAEvPbSYJaVFrBjbS1FWJtJw1dvVhAzNX5AMlPoflh4BH7g3bQnzy8rjhnKlK+
	BUoDRpiyben6itxkldTE5wuVYVm1jYt/eHOxyTrLXE0Xu4ktU+fEBUF+I+6T/DbUq8U8D9+hEMd
	lw/Klyv0o31mY41F3a1AQdiraUkZlq4xsM6hufIoWLgN6NXXudH/6bfRGDeNf9ZEGnMxRvqTjzh
	KVrfa1onFyYaooxa8x0ZmQL257xUVt1yJ87Vjnz69szKJKVizfioUzKKNhbNcOgi/puVDSgyRTg
	oFZkLWLRCHkP07L61YodT+Jrgw3WVzc7AdQ8m13cfSl86Cx2y2Zfyop4YjfZ4k3y1/eP3SbtnfJ
	TNPIwL/Q4IJpcGuA536w6LS6lJu89w0qQ==
X-Received: by 2002:a5d:6f11:0:b0:48d:ff71:dd9d with SMTP id ffacd0b85a97d-48e07f98e22mr625618f8f.23.1792171940078;
        Fri, 16 Oct 2026 10:32:20 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f8babsm6821024f8f.33.2026.10.16.10.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 10:32:19 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
Subject: [PATCH 00/24] Documentation fixes in unix(7)
Date: Fri, 16 Oct 2026 19:31:15 +0200
Message-ID: <20261016173139.13076-1-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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

