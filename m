Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.105.45.245
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793662889;
	b=w7RXJ5M6Him1KlK2JHATKMid7R7Ajuf91lH2PqDzGVjYGkGvT8q1tk5UCYpTB6IoMn5O
	 nBCmEYbOQoVz7u6j+oHy+LVwFkPCOHWYZ3Lq0c+axjaaI7f0+uYfUtroHDdFx+7e0eNi6
	 IWnr/QkxnbuXFhpS+A01Ly4VfhiXvkx2MSKslGKz58AFgbbW4bbKbDrM8b4zhbGEPbYjD
	 4SgvP62YbdxnXIlaO/hJm+6deLTJuZ3/XgOFZ/XLkCj5Yu62LSnbVPffOs7gIA2SMK9od
	 PFpVI9tftLjGSPCVlANYe1Vh8UA79OdpaGJTVcWfXkDSPM3vvadqsqhnsiyY/pZmd0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793662889;
	h=DMARC-Filter:Received:Received:Received:Received:From:To:CC:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:DKIM-Signature:x-ovh-tracer-id:X-VR-SPAMSTATE:
	 X-VR-SPAMSCORE:X-VR-SPAMCAUSE;
	bh=zxdqpWij+vqnU0XQiVnmLhb5M0+RBQ12ckn3WIcJsH4=;
	b=loEt6AuSy9q9PXJz/uwbt1+R4gGAjxDMy9gmtMC5Ls9K4HAkMkjYiJjF/U4Pqb9+LuyE
	 KhgqOAHpVXygUvprx9pevmJYrJmB3/09EXs0BAnQtAgpGI4MTlIxiHQKWKHgpU2unyzpo
	 B9QoPCy9ZCqNOOhbJdcP+a5EoYkkw2lbfckZvA3AYq389VNkNz39i5dhwJ1iQ4YNoWHoD
	 IvacBknk1bfQKNvyC7kwQng2183Lxsh1POxoE2BkvED5gbG7dY/Zr0qAnaqcODbgwKacZ
	 KmT57N2a2vroOhAkgghIVrXNctJdUnQfsg7c48ZrfjNiFTl+kNPMvglYf7P9zJm22LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=buffet.re;
	spf=pass smtp.mailfrom=buffet.re;
	dkim=pass header.d=buffet.re header.i=@buffet.re header.a=rsa-sha256 header.s=ovhemp1250268-selector1 header.b="FpP/bbci";
	arc=none smtp.remote-ip=46.105.45.245
Received: from 6.mo564.mail-out.ovh.net (6.mo564.mail-out.ovh.net [46.105.45.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF14606A326
	for <linux-man@vger.kernel.org>; Mon,  2 Nov 2026 23:41:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDF14606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=buffet.re
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buffet.re
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buffet.re header.i=@buffet.re header.a=rsa-sha256 header.s=ovhemp1250268-selector1 header.b=FpP/bbci
Received: from director6.derp.mail-out.ovh.net (director6.derp.mail-out.ovh.net [79.137.60.226])
	by mo564.mail-out.ovh.net (Postfix) with ESMTPS id 4jJSrv1cNnz85vm;
	Mon,  2 Nov 2026 23:41:19 +0000 (UTC)
Received: from director6.derp.mail-out.ovh.net (director6.derp.mail-out.ovh.net. [127.0.0.1])
        by director6.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
        for <mic@digikod.net>; Mon,  2 Nov 2026 23:41:19 +0000 (UTC)
Received: from DAG5EX1.emp3.local (unknown [10.108.54.104])
	by director6.derp.mail-out.ovh.net (Postfix) with ESMTPS id 4jJSrv034Tz46Zc;
	Mon,  2 Nov 2026 23:41:18 +0000 (UTC)
Received: from localhost.localdomain (88.142.38.18) by DAG5EX1.emp3.local
 (172.16.2.51) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 3 Nov
 2026 00:41:18 +0100
From: Matthieu Buffet <matthieu@buffet.re>
To: Alejandro Colomar <alx@kernel.org>, =?UTF-8?q?G=C3=BCnther=20Noack?=
	<gnoack3000@gmail.com>
CC: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	<linux-man@vger.kernel.org>, Matthieu Buffet <matthieu@buffet.re>
Subject: [PATCH v2 1/2] man/man2/landlock_add_rule.2: Clarify ephemeral port range
Date: Tue, 3 Nov 2026 00:39:31 +0100
Message-ID: <20261102233932.29912-1-matthieu@buffet.re>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <e354fb0d-2173-4015-b945-c413bb1b1c44@buffet.re>
References: <e354fb0d-2173-4015-b945-c413bb1b1c44@buffet.re>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CAS4.emp3.local (172.16.1.4) To DAG5EX1.emp3.local
 (172.16.2.51)
DKIM-Signature: v=1; a=rsa-sha256; d=buffet.re; s=ovhemp1250268-selector1;
 c=relaxed/relaxed; t=1793662878; h=from:to:subject:date;
 bh=zxdqpWij+vqnU0XQiVnmLhb5M0+RBQ12ckn3WIcJsH4=;
 b=FpP/bbciXDSRq/4997Tcx+kdl3JvLyAitGOD6UIQE/flpCKB+dnIf8wCclm+ZmOsOkyTygr5g1kG2hW5w2193trcMpiYo0djTB794fNdQ9N8Qb9QXjQ16KgRb/CdQh0RCBR6TM682H3tZcbfAYch4/FahHdb1Tn8+0rBa62fyb9oJfGn+jufqoQ42HLzc1Ih/EcdQaAuvkAybskC1sJ5K5Y3cmB4j7NRbaXvjRyJx66xY6+RyabjNiX4kM79FZr9l0S03Y+hxbG30bwQKsObHvd38qKrMncxTToJxtRML7zWPvZZQN+gyMWcv/Gwz1y6154Dgf8TMremZ4CeFh0AAA==
x-ovh-tracer-id: 2278539938543657494
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTEphfZsKKmCVTfyzIVRkKhwZZBtptM/X6Y9K5YP1EOTVM6zr74LLR3MRK0LsBeULDHp7d+N13SpBOa1YuPhIbjEaBMXl/eZ7lDz6hMpssqW7rwW9PKN9FEkuIQ20UsZWNn9e4s9DNAEaYfb83KfBUtMJuusMnyePRggjEb9oFzPIf3DGlhKdnXEjTKVA0LWLy35RF1Wv5o2mMXMjqJJQdes5bC5zY81itoXRZp52I1uj/XeAZGQjst8aCfrR5Ip0ibKKFyjkXCGfR8q6c2kuuDvRLwJdaN2JNRbktpT/00Uy3GfPryQFAANBdtTfhj9P+0zaiT/bazbw40RIGG790D6cht0ubyVj5wIfLNdfY/mQYE+krF4DUTqLegBphY78skD1xfTPal1DbL/DOV5uGlQFNEu4SvJo2SGLM3gawD8iwUVNOkkpEERQf3fHa6Q1SjuWfdBueAe0/SzvaLWVGAJ3rImaqL3ISs5CKiDF9p6mhtQo7w1jqrl1hb5nXHsqX1H1TKbcrEK30yyEEMl/DM2g5sET2OFj64Uag9hhwb80l4BWmFhXnUBDrjhqjLeCWIm0sM/YzDZ5OWWnWtvSNWW8Ru5pc74Eu1Jc7JpYnVq953tAJwUu4Q4cOe9cp8CfDBk0cyCIQ3RXODb5YmXnx1UPZfjj/fq5WZwkHrxKlwdYQ

Clarify that ephemeral port range can differ from system to system, and
that an application can choose exactly which ephemeral port will be
chosen next (as long as it is within the kernel-wide
ip_local_port_range).

Signed-off-by: Matthieu Buffet <matthieu@buffet.re>
---
 man/man2/landlock_add_rule.2 | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/man/man2/landlock_add_rule.2 b/man/man2/landlock_add_rule.2
index 94bc63068935..253498bfa2cf 100644
--- a/man/man2/landlock_add_rule.2
+++ b/man/man2/landlock_add_rule.2
@@ -109,9 +109,13 @@ is the network port in host endianness.
 It should be noted that port 0 passed to
 .BR bind (2)
 will bind to an available port from the ephemeral port range.
-This can be configured in the
+The range is configured globally in the
 .I /proc/sys/net/ipv4/ip_local_port_range
-sysctl (also used for IPv6).
+sysctl (also used for IPv6),
+and can be further restricted per socket using
+.BR setsockopt (2)
+with
+.BR IP_LOCAL_PORT_RANGE (2const).
 .IP
 A Landlock rule with port 0
 and the

base-commit: c189a6b2e4dd2e74f3b360b24e489e27f4e45bad
-- 
2.47.3

