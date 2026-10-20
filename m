Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=144.76.212.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792512065;
	b=jRhhz/cIKypQ7XtCRP46J6PyHUWExkIi8F64JcxSdq1UXmC8a6nLwVTrP7F8KPfk7mD7
	 XNHM+ACoHaP9zn32SJg1RUZOL6Ft9301JcR5V/R4Cem1Teqjm/Y+dHn1UfrzS53R4pGaF
	 ++d7LzOJpfDOqGvcUXVfjI8qdezKYekFf2fTzPF/l6xwQB1kf7OqH0FZVqZkC91YMi05p
	 WSuEtja/Q7wUeSW4D4ea9WcLqBdNLdY6QPCY42oNmceAtZ+3aQELvW9tsSq9pGntcmzDW
	 HdpxXdEimsnt2Euem1yzxGq/XIDf3gipXfRzJduSaufUflosL6pmLgWCRufNJYbn3uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792512065;
	h=Received:Received:Date:From:To:cc:Subject:In-Reply-To:Message-ID:
	 References:User-Agent:MIME-Version:Content-Type;
	bh=lso9H9pKHL+sW6GNwWpeRtcs+gFeMJFsmdWYYlPt9KQ=;
	b=PIjy0u6LaYxKs4NvT4L7RxR/2QI7g9IlAlg6jlmRzAwp5pOLlkPqDrLDbkpsGlsmQAn9
	 2BQlvbqW6uR87L5cv8dhiafdVjPdHZe4A4oorL8A5gfYISRXhHV+2WLJz8jmoTlkAVrDt
	 Dwxnw+ZXDs0lc5qsNa3U8EfGaxlyvuxaIZ7wj5DG6NiVvwX5Pu0CNAOwOhqfIgfUUpeYv
	 H/+7d7PkFpRWcAu6+LhOCwxJ885wKRYalSrr4/jLbkqKdcqIUF4/P5O0FIpw6DHYQl5FN
	 D4HUj1b/I/j6/ycTBIV71YcmRUXYq2iFVBAe7cp6uRIueGU/tqjV8dktDaEsuW8vxXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=inai.de;
	spf=pass smtp.mailfrom=inai.de;
	arc=none smtp.remote-ip=144.76.212.145
Received: from a3.inai.de (a3.inai.de [144.76.212.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF96606A31B
	for <linux-man@vger.kernel.org>; Tue, 20 Oct 2026 16:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=inai.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inai.de
Received: by a3.inai.de (Postfix, from userid 25121)
	id 3AECD1018A16A2; Tue, 20 Oct 2026 18:01:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by a3.inai.de (Postfix) with ESMTP id 38E4B1100D0C03;
	Tue, 20 Oct 2026 18:01:02 +0200 (CEST)
Date: Tue, 20 Oct 2026 18:01:02 +0200 (CEST)
From: Jan Engelhardt <ej@inai.de>
To: Alejandro Colomar <alx@kernel.org>
cc: linux-man@vger.kernel.org
Subject: Re: [PATCH] man/man3/getnameinfo.3: Mention behavior for AF_UNIX
In-Reply-To: <atd04IuG4GBl6PxM@debian>
Message-ID: <q790883o-osno-6n75-230r-485465rpq4r7@vanv.qr>
References: <20261020115143.75371-1-jengelh@inai.de> <atd04IuG4GBl6PxM@debian>
User-Agent: Alpine 2.26 (LSU 649 2022-06-02)
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Tuesday 2026-10-20 16:27, Alejandro Colomar wrote:
>
>I'd rewrite a little bit:
>
>	.SH VERSIONS
>	POSIX only specifies the behavior for sockets of the
>	.B AF_INET
>	and
>	.B AF_INET6
>	address families.
>	Other address families are non-portable;
>	for example, for
>	.BR AF_UNIX ,
>	many libc implementations fail,
>	some succeed but provide zero-length strings in
>	.I host
>	and
>	.IR serv ,
>	and some fill these buffers with pseudo-values.
>
>BTW, out of curiosity, what do those pseudo-values look like?

(Something must have gone wrong seeing zero-length output.
So I redid the test program and runs.)

getnameinfo:

* FreeBSD 15: fills host="/path", serv="", returns success(0).

* glibc 2.44: fills host=<utsname> (flags=0) or host="localhost"
  (flags=NI_NUMERICHOST), and serv="/path", returns success(0).

* OpenBSD 7.9: signals EAI_FAMILY. Upon seeing NI_NUMERICHOST,
  signals EAI_SYSTEM instead (odd).

* OmniOS r151046 (Solaris): signals EAI_FAMILY.

* musl-libc 1.2.6 (Alpine Linux): signals EAI_FAMILY.

* cygwin 3.6.11: signals EAI_FAMILY.

getaddrinfo:

* FreeBSD: getaddrinfo("/the/socket/path", nullptr,
  hints_with_AF_UNIX, ...) succeeds.

* the rest: signals EAI_FAMILY.


---
#include <sys/un.h>
#include <netdb.h>
#include <sys/socket.h>
#include <cstdio>
#include <cstring>

int main()
{
	struct sockaddr_un u{};
	u.sun_family = AF_UNIX;
	strcpy(u.sun_path, "/pa");
	char host[320] = "!", serv[320] = "!";

	auto ret = getnameinfo(reinterpret_cast<struct sockaddr *>(&u),
	           sizeof(u), host, sizeof(host), serv, sizeof(serv), 0);
	printf("GNI %d %s\n", ret, gai_strerror(ret));
	if (ret == 0)
		printf("GNI <%s> <%s>\n", host, serv);

	ret = getnameinfo(reinterpret_cast<struct sockaddr *>(&u),
	      sizeof(u), host, sizeof(host), serv, sizeof(serv), NI_NUMERICHOST | NI_NUMERICSERV);
	printf("GNI %d %s\n", ret, gai_strerror(ret));
	if (ret == 0)
		printf("GNI <%s> <%s>\n", host, serv);

	struct addrinfo hints{};
	hints.ai_family = AF_UNIX;
	hints.ai_socktype = 0;
	struct addrinfo *res = nullptr;
	ret = getaddrinfo(host, serv, &hints, &res);
	printf("GAI %d %s\n", ret, gai_strerror(ret));
	if (ret == 0)
		for (; res != nullptr; res = res->ai_next)
			printf("GAI fam %u %u %u\n", res->ai_family,
				res->ai_socktype, res->ai_protocol);
	return 0;
}
