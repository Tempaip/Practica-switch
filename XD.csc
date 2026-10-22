using System;

namespace HelloWorld
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("===== CAJA REGISTRADORA =====");
            Console.WriteLine("1. Calcular cambio en billetes y monedas");
            Console.WriteLine("2. Aplicar descuento por tipo de cliente");
            Console.WriteLine("3. Validar fecha de entrega");
            Console.WriteLine("4. Verificar folio capicúa");
            Console.WriteLine("5. Redondear precio y diferencia de inventario");
            Console.WriteLine("6. Salir");
            Console.WriteLine("Elige una opción:");
            
            int op = int.Parse(Console.ReadLine());
            int faltante = 0;
            
            switch (op)
            {
                case 1:
                    Console.WriteLine("Introduce el precio: ");
                    int precio = int.Parse(Console.ReadLine());
                    
                    Console.WriteLine("Introduce el pago: ");
                    int pago = int.Parse(Console.ReadLine());
                    
                    if (pago < precio)
                    {
                        faltante = precio - pago;
                        Console.WriteLine("Pago insuficiente, falta " + faltante);
                    }
                    else if (pago == precio)
                    {
                        Console.WriteLine("Pago exacto, no hay cambio.");
                    }
                    else
                    {
                        int cambio = pago - precio;
                        Console.WriteLine("Cambio total: " + cambio);
                        Console.WriteLine("Desglose del cambio:");

                        int cantidad;

                        cantidad = cambio / 200;
                        cambio = cambio % 200;
                        if (cantidad > 0)
                        {
                            Console.WriteLine(cantidad + " billete(s) de 200");
                        }

                        cantidad = cambio / 100;
                        cambio = cambio % 100;
                        if (cantidad > 0)
                        {
                            Console.WriteLine(cantidad + " billete(s) de 100");
                        }

                        cantidad = cambio / 50;
                        cambio = cambio % 50;
                        if (cantidad > 0)
                        {
                            Console.WriteLine(cantidad + " billete(s) de 50");
                        }

                        cantidad = cambio / 20;
                        cambio = cambio % 20;
                        if (cantidad > 0)
                        {
                            Console.WriteLine(cantidad + " billete(s) de 20");
                        }

                        cantidad = cambio / 10;
                        cambio = cambio % 10;
                        if (cantidad > 0)
                        {
                            Console.WriteLine(cantidad + " moneda(s) de 10");
                        }

                        cantidad = cambio / 5;
                        cambio = cambio % 5;
                        if (cantidad > 0)
                        {
                            Console.WriteLine(cantidad + " moneda(s) de 5");
                        }

                        cantidad = cambio / 2;
                        cambio = cambio % 2;
                        if (cantidad > 0)
                        {
                            Console.WriteLine(cantidad + " moneda(s) de 2");
                        }

                        cantidad = cambio / 1;
                        cambio = cambio % 1;
                        if (cantidad > 0)
                        {
                            Console.WriteLine(cantidad + " moneda(s) de 1");
                        }
                    }
                    break;
                
                case 2:
                    Console.WriteLine("Introduce el subtotal: ");
                    double subtotal = double.Parse(Console.ReadLine());
                    
                    Console.WriteLine("Introduce el tipo de cliente (E: Estudiante, D: Docente, G: General): ");
                    char tipoCliente = char.Parse(Console.ReadLine());
                    
                    Console.WriteLine("¿Tiene credencial? (S/N): ");
                    char credInput = char.Parse(Console.ReadLine());
                    bool tieneCredencial = (credInput == 'S' || credInput == 's');
                    
                    double descuentoBase = 0;
                    bool clienteValido = true;
                    
                    switch (tipoCliente)
                    {
                        case 'E':
                        case 'e':
                            descuentoBase = 0.15;
                            break;
                        case 'D':
                        case 'd':
                            descuentoBase = 0.10;
                            break;
                        case 'G':
                        case 'g':
                            descuentoBase = 0.0;
                            break;
                        default:
                            clienteValido = false;
                            Console.WriteLine("Tipo de cliente no válido");
                            break;
                    }
                    
                    if (clienteValido)
                    {
                        double descuentoAdicional = 0;
                        if ((subtotal >= 500 && tieneCredencial) || (tipoCliente == 'D' || tipoCliente == 'd'))
                        {
                            descuentoAdicional = 0.05;
                        }
                        
                        double descuentoTotalPorcentaje = descuentoBase + descuentoAdicional;
                        double montoDescuento = subtotal * descuentoTotalPorcentaje;
                        double totalPagar = subtotal - montoDescuento;
                        
                        Console.WriteLine("Subtotal: " + subtotal);
                        Console.WriteLine("Descuento total: " + montoDescuento + " (" + (descuentoTotalPorcentaje * 100) + "%)");
                        Console.WriteLine("Total a pagar: " + totalPagar);
                    }
                    break;

                case 3:
                    Console.WriteLine("Introduce el día: ");
                    int dia = int.Parse(Console.ReadLine());
                    
                    Console.WriteLine("Introduce el mes: ");
                    int mes = int.Parse(Console.ReadLine());
                    
                    Console.WriteLine("Introduce el año: ");
                    int anio = int.Parse(Console.ReadLine());
                    
                    bool esBisiesto = (anio % 4 == 0 && anio % 100 != 0) || (anio % 400 == 0);
                    int diasMes = 0;
                    bool mesValido = true;
                    
                    switch (mes)
                    {
                        case 1:
                        case 3:
                        case 5:
                        case 7:
                        case 8:
                        case 10:
                        case 12:
                            diasMes = 31;
                            break;
                        case 4:
                        case 6:
                        case 9:
                        case 11:
                            diasMes = 30;
                            break;
                        case 2:
                            diasMes = esBisiesto ? 29 : 28;
                            break;
                        default:
                            mesValido = false;
                            break;
                    }
                    
                    if (mesValido && dia >= 1 && dia <= diasMes)
                    {
                        if (esBisiesto)
                        {
                            Console.WriteLine("Fecha válida, año bisiesto");
                        }
                        else
                        {
                            Console.WriteLine("Fecha válida, año no bisiesto");
                        }
                    }
                    else
                    {
                        if (esBisiesto)
                        {
                            Console.WriteLine("Fecha inválida, año bisiesto");
                        }
                        else
                        {
                            Console.WriteLine("Fecha inválida, año no bisiesto");
                        }
                    }
                    break;

                case 4:
                    Console.WriteLine("Introduce un folio de 4 dígitos: ");
                    int folio = int.Parse(Console.ReadLine());
                    
                    if (folio >= 1000 && folio <= 9999)
                    {
                        int d1 = folio / 1000;
                        int d2 = (folio / 100) % 10;
                        int d3 = (folio / 10) % 10;
                        int d4 = folio % 10;
                        
                        bool esCapicua = (d1 == d4 && d2 == d3);
                        int suma = d1 + d2 + d3 + d4;
                        long producto = (long)d1 * d2 * d3 * d4;
                        
                        string parImpar = (suma % 2 == 0) ? "par" : "impar";
                        
                        if (esCapicua)
                        {
                            Console.WriteLine("Es capicúa, suma = " + suma + " (" + parImpar + "), producto = " + producto);
                        }
                        else
                        {
                            Console.WriteLine("No es capicúa, suma = " + suma + " (" + parImpar + "), producto = " + producto);
                        }
                    }
                    else
                    {
                        Console.WriteLine("Folio inválido");
                    }
                    break;

                case 5:
                    Console.WriteLine("--- Parte A: Redondear precio ---");
                    Console.WriteLine("Introduce un precio positivo (double): ");
                    double precioOriginal = double.Parse(Console.ReadLine());
                    
                    int precioRedondeado = (int)(precioOriginal + 0.5);
                    double diferenciaDecimal = precioOriginal - (int)precioOriginal;
                    
                    Console.WriteLine("Precio redondeado: " + precioRedondeado);
                    Console.WriteLine("Parte decimal descartada/agregada: " + diferenciaDecimal);
                    
                    Console.WriteLine("--- Parte B: Diferencia de inventario ---");
                    Console.WriteLine("Introduce las piezas esperadas: ");
                    int esperadas = int.Parse(Console.ReadLine());
                    
                    Console.WriteLine("Introduce las piezas contadas: ");
                    int contadas = int.Parse(Console.ReadLine());
                    
                    int dif = contadas - esperadas;
                    int difAbs = (dif < 0) ? -dif : dif;
                    
                    if (dif == 0)
                    {
                        Console.WriteLine("Inventario correcto");
                    }
                    else if (contadas < esperadas)
                    {
                        Console.WriteLine("Faltan " + difAbs + " piezas");
                    }
                    else
                    {
                        Console.WriteLine("Sobran " + difAbs + " piezas");
                    }
                    break;

                case 6:
                    Console.WriteLine("Gracias por usar la caja registradora");
                    break;
                
                default:
                    Console.WriteLine("Opción no válida");
                    break;
            }
        }
    }
}
