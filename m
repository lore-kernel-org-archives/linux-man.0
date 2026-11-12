Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=140.77.13.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794483644;
	b=ZoZeVqdd5nLe/rM++8IR+/c56l7GL/IJJbRTGmlbfeRWKPZveix5yJ/TCxPp0gVtfdja
	 JXHFp/L43HWU/Q8euefPK0Sxq3HFWHqIC0RZ+XiQjvf5V9+8Y5k21zAXi26ipPBjo0G1+
	 L6XlhUopv4wfIRG6LxsQFeoC1jIzF6oc9XkXoR8KIHSr7efjhtAwXF1MBPVKJIQMR2FPE
	 Ti1BEjf28XErixMiUKUBEvKYdG2Ob2x4UAv9IsdOt9tk/ZHwyruCufGf4FC35JzJOF3N4
	 /COL0AzbEPLaeUjyetFshtE7GkX3hlog/vw401CIDE12gVuQArT4L6HLea8Rp8Lk/Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794483644;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:
	 Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Mailer-Info:User-Agent;
	bh=Rl5fWEcHjBrunqki76JRdffVUGEFmz2IhYbK6nRP92A=;
	b=nyufZ9X6xCxPuKD3CTQ0NCe+nxcAr1Fy9EBsNhsKj9XJEaOCi117jKR+SJ+ctvcYrMf2
	 eLxtdI13koTdkoINvvr4kRzOCFP2aGOgFL0Lbhlqw6e9D1NhFrFDHg5oOLcgpw5DbdNjk
	 SQyRYyp0wWgdXH9TF+XAyz05U0XlnQyKmkVDbPZiqfPPvMYG7qDwz32TzWbiJQwrlM6mo
	 kadnhi44U1J/sAm/NWFN/39M2gOalKRA+z0p/mXOmwjPa1rU3MlkZNDPMNeFvyJkhU+FV
	 ltQWS+4DulERBILC4e5+rfKeb8uWu/StU6MdFp410LNWhhDocXsITRJvrIIg+8CkbCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=vinc17.net;
	spf=pass smtp.mailfrom=vinc17.net;
	arc=none smtp.remote-ip=140.77.13.17
Received: from cventin.lip.ens-lyon.fr (cventin.lip.ens-lyon.fr [140.77.13.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DA7606A89E
	for <linux-man@vger.kernel.org>; Thu, 12 Nov 2026 11:40:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39DA7606A89E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vinc17.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinc17.net
Received: from vlefevre by cventin.lip.ens-lyon.fr with local (Exim 4.100.1)
	(envelope-from <vincent@vinc17.net>)
	id 1xRTAP-00000000u7V-2RCb;
	Thu, 12 Nov 2026 12:40:33 +0100
Date: Thu, 12 Nov 2026 12:40:33 +0100
From: Vincent Lefevre <vincent@vinc17.net>
To: Alejandro Colomar <alx@kernel.org>
Cc: Rich Felker <dalias@libc.org>,
	Alejandro Colomar <alx+linux-man@kernel.org>,
	linux-man@vger.kernel.org, libc-alpha@sourceware.org,
	Walter Harms <wharms@bfs.de>, ~hallyn/shadow@lists.sr.ht,
	musl@lists.openwall.com
Subject: Re: [musl] Re: [PATCH v1] man/man3/crypt.3: These functions accept
 many algorithms, not only DES
Message-ID: <20261112114033.GA167321@cventin.lip.ens-lyon.fr>
Mail-Followup-To: Vincent Lefevre <vincent@vinc17.net>,
	Alejandro Colomar <alx@kernel.org>, Rich Felker <dalias@libc.org>,
	Alejandro Colomar <alx+linux-man@kernel.org>,
	linux-man@vger.kernel.org, libc-alpha@sourceware.org,
	Walter Harms <wharms@bfs.de>, ~hallyn/shadow@lists.sr.ht,
	musl@lists.openwall.com
References: <313da4c4e217a58e49e981f62d16bd15c97352bf.1794268615.git.alx@kernel.org>
 <avJeq6_q5rpqoGlW@devuan>
 <20261112015223.GA242717@joooj.vinc17.net>
 <20261112025339.GM26138@brightrain.aerifal.cx>
 <20261112032929.GB160897@qaa.vinc17.org>
 <20261112033742.GG5716@brightrain.aerifal.cx>
 <avWT2aQCFY2GIwLp@devuan>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <avWT2aQCFY2GIwLp@devuan>
X-Mailer-Info: https://www.vinc17.net/mutt/
User-Agent: Mutt/2.4.3+67 (b2844dd7) vl-188789 (2026-11-11)

On 2026-11-12 11:28:20 +0100, Alejandro Colomar wrote:
> Yeah, I think it'd be okay to document that this is an extension to
> POSIX.  Perhaps, we could add this:
> 
> 	@@ -111,6 +111,9 @@ .SH ATTRIBUTES
> 	 .BR crypt_r ()
> 	 T}     Thread safety   MT-Safe
> 	 .TE
> 	+.SH VERSIONS
> 	+While POSIX only specifies the DES algorithms for these functions,
> 	+all systems implement several other algorithms.

No, POSIX just says: "The algorithm is implementation-defined."
No mention of DES algorithms at all.

And note that only ENOSYS is specified as a case of failure,
which could explain why some applications do not check whether
the returned value is a null pointer (i.e. they assume that if
crypt() succeeds in usual cases, then an ENOSYS error is not
possible and crypt() never fails).

But my point was that POSIX disallows the "$" character in salt:

  [...] The salt argument shall be a string of at least two bytes
  in length not including the null character chosen from the set:

  a b c d e f g h i j k l m n o p q r s t u v w x y z
  A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
  0 1 2 3 4 5 6 7 8 9 . /

This means that when "$" is supported by some implementation,
the interpretation of the return value may be different from
what POSIX specifies.

Various people said that the choice of returning "*" in case of
failure as done by musl was a violation of POSIX. But this is
not true for 2 reasons:
  * the use of the "$" character in salt by the application;
  * the fact that POSIX does not give any requirement on the
    hash (so the use of a hash that could be interpreted as
    being invalid on the system for unsupported passwords is
    a valid behavior).

-- 
Vincent Lefèvre <vincent@vinc17.net> - Web: <https://www.vinc17.net/>
100% accessible validated (X)HTML - Blog: <https://www.vinc17.net/blog/>
Work: CR INRIA - computer arithmetic / Pascaline project (LIP, ENS-Lyon)
