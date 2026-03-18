Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255401C84B8
	for <linux-man@vger.kernel.org>; Wed, 18 Mar 2026 00:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773795383; cv=none; b=F7AjkTnBOPJChSsJLIy8cUIBd670NTmA0/N90vbrWuUTYFo0uY5TWrylxI928KrE9o0TIill4uaacIJddbJFz1h7GheZfdixFAA6ZdFMLL6yRQWlWkVa+UgOhbTqPbaLotL1mTHU3hPRukRePe6rXbHz5/cdgWfNiW28ZAf7a8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773795383; c=relaxed/simple;
	bh=6wEL0skt5/Cp+pg9HmL3UUGllZydst9EXCaTeh+/cTE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i77volaz4/8DTWMKJMKfDa0TAI9o501nj1T+A/GPBeXO8yOFWhtpR5ZXPb3w/WRSxlBQs8zjYsDh8+TW1JvM3WdL0ohDrv3MR86i2t8dhIaWLnPpwyVkOxISB6WqWnAyOebrYCWgRIeWrkh3ex5DgGJNDXyVnZWGq2uAsd5qeOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lVsL5+tO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lVsL5+tO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E20A3C4CEF7;
	Wed, 18 Mar 2026 00:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773795382;
	bh=6wEL0skt5/Cp+pg9HmL3UUGllZydst9EXCaTeh+/cTE=;
	h=Date:From:To:Cc:Subject:From;
	b=lVsL5+tO2LMcpEWOOiKx3ADe7YvytGaCR2u1Cl5byMgFYXsYxKVEWypaRBaBG5PDS
	 JU+7GLh/wgD0ZlXVOu7cviKYAashpDF2amFCr2l6+45Z2rAD7c9hy2/5x9Nws6PSym
	 y6xXW94CjkwGssrGUmPWVHiKxZRv4CXS1P+6xYiQGp4Ww5xMBCFJmaRyT6k4hhb9gD
	 UaPdDvKe5kPqnwbOQ7+ITsYbaXuoPRj6rBJXiKOk3YQm7mOU/xuHLGsQhXqLr9RlGf
	 bCP+K0/JeFDID2XaSvzD0wJVAQCP0Jdp3u3ugMhreGPHZ/JJaSSlJu4pOphXvqVQVU
	 vBaJkISt+1YGg==
Date: Wed, 18 Mar 2026 01:56:19 +0100
From: Alejandro Colomar <alx@kernel.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: linux-man@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>
Subject: [dramforever@live.com: [PATCH] man/man5/proc_pid.5: Clarify which
 user namespace affects permissions]
Message-ID: <abn3rJaXlmU1Zr2i@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rduu7efnxcdghcpi"
Content-Disposition: inline


--rduu7efnxcdghcpi
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: linux-man@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>
Subject: [dramforever@live.com: [PATCH] man/man5/proc_pid.5: Clarify which
 user namespace affects permissions]
Message-ID: <abn3rJaXlmU1Zr2i@devuan>
MIME-Version: 1.0

Hi Vivian,

Can you please confirm this is you?  I received this patch from an
address that doesn't match the one I see in your kernel commits, and
when I replied to <dramforever@live.com>, the message bounced.  I'm just
checking.  See patch from the @live.com address below.


Have a lovely night!
Alex

----- Forwarded message from Vivian Wang <dramforever@live.com> -----

Date: Mon, 16 Mar 2026 22:07:52 +0800
=46rom: Vivian Wang <dramforever@live.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>
Subject: [PATCH] man/man5/proc_pid.5: Clarify which user namespace affects
 permissions
Message-ID: <OSCPR01MB134682A1A80B8C9FB71CBA64DC640A@OSCPR01MB13468.jpnprd0=
1.prod.outlook.com>
User-Agent: Mozilla Thunderbird

A more careful reading of fs/proc/base.c (since v4.11, as of v7.0-rc1)
reveals that it is not task->cred->user_ns that is checked, but
task->mm->user_ns, which is set during execve(2) (and copied over in
fork(2) and so on) [1], and is the correct user namespace to check for
ptrace-related purposes. Clarify the relevant text.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/com=
mit/?id=3Dbfedb589252c01fa505ac9f6f2a3d5d68d707ef4

Fixes: ae636827 ("proc.5: Fix description of /proc/PID/* ownership to accou=
nt for user namespaces")
Signed-off-by: Vivian Wang <dramforever@live.com>
---
 man/man5/proc_pid.5 | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/man/man5/proc_pid.5 b/man/man5/proc_pid.5
index eac97fa1d..2fe35bd09 100644
--- a/man/man5/proc_pid.5
+++ b/man/man5/proc_pid.5
@@ -30,7 +30,9 @@ Before Linux 4.11,
 meant the "global" root user ID and group ID
 (i.e., UID 0 and GID 0 in the initial user namespace).
 Since Linux 4.11,
-if the process is in a noninitial user namespace that has a
+if when the last time the process called
+.BR execve (2),
+it was in a noninitial user namespace that has a
 valid mapping for user (group) ID 0 inside the namespace, then
 the user (group) ownership of the files under
 .IR /proc/ pid
--=20
2.53.0



----- End forwarded message -----

--=20
<https://www.alejandro-colomar.es>

--rduu7efnxcdghcpi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmm5+DMACgkQ64mZXMKQ
wqldCQ//ce5MZNpUbAxAa0x36TVtgxufKicakRb6wSZdW7en1N9Y4mGoThv6QOOY
mtql5JZy7rWwDC/EJT9nTqHC9cv0RrMv6T1pwXWAduTegRNqQTKxa+1ujEMq4gHZ
o7YiQ3kGSSf4sXGdANf75kSKua9kMyjyJCg1Oq0P1m5qgRGFZfvq/qTevyKDM1AU
Z1/wLneirz4jRsxwntqEGanXY2UGJfsjerqIOH2O4cHLdVetWaDnN4Bw8DzyHeP1
9hnNM9K0HFxMhgjRmAWqVxJXwxSTfrSI6Na/VH/L1EVj6pjtrhfRBk2wZeFzBr+s
6npte3Y3osQsE6rI1Vx4tTVYNm8aQbpQfK+Jre6Hy3FSqqH+8KbaNX7H3HYt3nue
SKv54Biqbsj0vniucOarJ9FzQ2HIbrwHTs/BvPx2WAKA8K+bc6kYZpXsPywTsbVS
gwsErOUaqCLZ5zEWd8+pTJlwPXyD157cDDktgs0FtnVxaYmqE+yUKmRUuYePfeRK
/aN7etM3mQi46ZPKS3kviskc9m0bavPVUY7ejrsXbtdzGBQiF4fhYD7NZp1S0bZh
MCbead2XyLP6TNZBsFfGm8RVDg07CMAUAlUJLdzX6xOh/ljB+J17q0j5OseMNr1Q
mibGvtVMlwNKUgU4z4jiNDFq6LqQ/edNT8rQAD12tSo4NBm7srs=
=/THD
-----END PGP SIGNATURE-----

--rduu7efnxcdghcpi--
