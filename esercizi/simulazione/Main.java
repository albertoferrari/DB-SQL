
public class Main {

	public static void main(String[] args) {
		
		Sim s = new Sim("333 445566", 20);
		System.out.println(s);
		Telefonata t1,t2;
		t1 = new Telefonata("0521 121212", 7230);
		t2 = new Telefonata("333 112233", 33);	
		s.inserisciTelefonata(t1);
		s.inserisciTelefonata(t2);
		System.out.println(s);
		System.out.println(s.durataTelefonate());
	}

}
