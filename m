Received: from mail.cock.li (mail.cock.li [37.120.193.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120B830ACEE
	for <linux-man@vger.kernel.org>; Sat, 12 Sep 2026 22:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.120.193.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789250472; cv=none; b=i2gzZ4O+pnehtXDcS3Ed3u8lotxTUxhSf7gIp7XHrxBvlwGBUbEzpPGHg306M2drHA7iT4m1+o83rOq5rUhVSPu2OrLBYbG89g2o/Ftl3zIlGJGwX4p/jE/OKo5gtR1wZjg86OHoMeGvYgaKd79qNTEqfOrzkL2nu/L3+JhCB6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789250472; c=relaxed/simple;
	bh=85OjSjf5hRYrZW3aZsjC+Y0c1zYqoz4rKCFS8NLWL2g=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:Mime-Version; b=t8yD/khhnbXRR9QDq5negH49Y3PjFJGMvIaLDA0Y9KjulKtb5hciJURzzsBi9ZHCXyMhLMtCOtr8AlEIblsyxF+1tVX3AcRP77uCRUJShSI//go7XeUBS2XZXNJc9ZeCPKt4aH8u6Yqd4PJJm7J71ywJbIvjf81bzNouycAgv9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=memeware.net; spf=pass smtp.mailfrom=memeware.net; dkim=pass (2048-bit key) header.d=memeware.net header.i=@memeware.net header.b=vmkGyYF1; arc=none smtp.client-ip=37.120.193.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=memeware.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=memeware.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=memeware.net header.i=@memeware.net header.b="vmkGyYF1"
Content-Type: text/plain; charset=UTF-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=memeware.net; s=mail;
	t=1789250467; bh=85OjSjf5hRYrZW3aZsjC+Y0c1zYqoz4rKCFS8NLWL2g=;
	h=Date:Cc:Subject:From:To:From;
	b=vmkGyYF1NQXq5oEPG8NOj8n+pRJzDacbdRInhg0QM3c6kv4ldqaOd+Bif+Sqbomtr
	 ztgFTu1/SrsQQYI/fa29NSHTrKGZVzqgQArsKnmzPAC0m/LPCCPgPK7Jvm+kQfA9yX
	 9I0CZ/czPpx1Em8MJwRJNFozczvVnG73LChPsyLOcPVDK6/8vbrshP42nABdy1x4XE
	 NdYtQ32K47+bDywg9ORXgR4n833aI1xKUJENtBepUvMMBJu/qCDzMIBbK/iysy/A3e
	 AvsOeZ8OUeEn7eQQVJHNBB3yFD7KZKq+LpBKQGAWWCTs3S8OVxfrZP0ynryGEfskMe
	 XV+Le3KghthPA==
Date: Sat, 12 Sep 2026 22:00:57 +0000
Message-Id: <DLDOCNQUCW9N.3GGL01BMV0HNG@memeware.net>
Cc: "linux-man" <linux-man@vger.kernel.org>
Subject: ioperm(2): confusing terminology
From: "astian" <astian@memeware.net>
To: "Alejandro Colomar" <alx@kernel.org>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable

ioperm(2) says:

  int ioperm(unsigned long from, unsigned long num, int turn_on);

  ioperm() sets the port access permission bits for the calling thread
  for num bits starting from port address from.  If turn_on is nonzero,
  then permission for the specified bits is enabled; otherwise it is
  disabled. [...]

The use of "bits" here is confusing/sloppy.

ioperm is supposed to enable or disable permission to access IO ports
for the calling thread.  In this API, the "permission bit" (singular) is
really "turn_on": 0 to disable access, non-zero to enable.  However this
description refers also "num bits starting from port address from" and
"the specified bits".  That seems to suggest that IO ports somehow refer
to "bits" and this API controls access permission to them, which is
bewildering.

Searching around I have seen that other versions of this manpage used to
say "bytes" instead of "bits", which is only slightly less bewildering.
Ports/addresses in the IO space refer neither to bits nor to bytes per
se, they are an abstract interface, like a syscall number/index.
(Architecturally, in some cases, these indices may in fact map to
processor registers which may in fact be portions of a contiguous
internal memory, so in some cases one could correctly say that the ports
refer to "bytes" in such memory, but this is obviously all very
low-level and microarchitecture-specific.  I think being aware of such
details actually makes this description more confusing.)

Apparently the reason for this confusing description is that for Linux
ioperm is a syscall and the kernel implements this syscall using a
bitmap with 1 bit (permitted/denied) for each port, in a contiguous
sequence.  See ksys_ioperm in "arch/x86/kernel/ioport.c".

Thus "num bits starting from port address from" actually refers to the
bits of that bitmap: the bits [from, from+num) are set according to
turn_on.

This kind of implicit reference to implementation details is wicked.

Suggested change:

  ioperm() sets the calling thread's access permission for num ports
  starting from port address from.  If turn_on is nonzero, then
  permission for the specified ports is enabled; otherwise it is
  disabled. [...]

PS: Oh, also, maybe the title should say "set input/output port
permissions" instead of "set port input/output permissions".
